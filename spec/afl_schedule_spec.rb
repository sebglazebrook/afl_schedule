require 'spec_helper'

describe AFL do

  let(:subject) { AFL::Schedule.new }

  describe 'all teams' do

    ['Adelaide', 'Brisbane', 'Carlton', 'Collingwood', 'Essendon',
     'Fremantle', 'Geelong', 'Gold Coast', 'Greater Western Sydney', 'Hawthorn',
     'Melbourne', 'North Melbourne', 'Port Adelaide', 'Richmond', 'St Kilda',
     'Sydney', 'West Coast', 'Western Bulldogs'].each do |team|
      it "returns data for #{team}" do
        result = subject.next_match(team)
        teams = [result.home_team, result.away_team]
        teams.should include(team)
      end
    end

  end

end