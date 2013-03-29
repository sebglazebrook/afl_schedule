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

    end

    def generate_response(fixture)

    end
  end

end