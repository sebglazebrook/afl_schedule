require 'spec_helper'

describe AFL::FixtureImporter do

  context 'team name given' do

    it 'returns a collection of games for that team in chronolical order' do
      matches = AFL::FixtureImporter.new(2013, 'Geelong').import
      matches.respond_to?(:size).should == true
      matches.first.time.should < matches[1].time
    end

    %i(home_team away_team venue time round).each do |attribute|
      it "returns a '#{attribute}' value" do
        matches = AFL::FixtureImporter.new(2013, 'Hawthorn').import
        matches.first.send(attribute).should_not be nil
      end
    end

  end

  context 'no team name given' do
    #@TODO
  end

end