module AFL
  class Season

    def initialize(year, team_name = nil)
      @year, @team_name = year, team_name
      @team_name ? @matches = team_matches : @matches = season_matches
    end

    def next_match(time = Time.now)
      @matches.each do |match|
        if match.time > time
          break match
        end
      end
    end

    private

    def team_matches
      FixtureImporter.new(@year, @team_name).import
    end

    def season_matches
      #@TODO
    end

  end
end