require 'csv'
require 'ostruct'
require 'chronic'

module AFL
  class FixtureImporter

    def initialize(year, team_name = nil)
      @year, @team_name = year, team_name
    end

    def import
      generate_response(fixture)
    end

    private

    def fixture
      res = []
      CSV.foreach("#{data_path}/#{filename}", {:headers => true, :header_converters => :symbol}) do |row|
        hashed_row = {}
        row.headers.each do |key|
          hashed_row[key.to_sym] = row[key]
        end
        res << hashed_row
      end
      res
    end

    def generate_response(fixture)
      fixture.map do |match|
        format_response(match)
      end
    end

    def data_path
      "#{AFL.root}/data/#{@year}"
    end

    def filename
      filenames.detect { |filename| filename.match(@team_name)}
    end

    def filenames
      Dir.entries("#{AFL.root}/data/#{@year}")
    end

    def format_response(match_data)
      OpenStruct.new(:home_team => home_team(match_data),
                     :away_team => away_team(match_data),
                     :venue =>  venue(match_data),
                     :time => time(match_data))
    end

    def home_team(match_data)
      match_data[:subject].split.first
    end

    def away_team(match_data)
      match_data[:subject].split[2]
    end

    def venue(match_data)
      match_data[:location]
    end

    def time(match_data)
      Chronic.parse("#{match_data[:start_date]} #{match_data[:start_time]}" )
    end



  end

end