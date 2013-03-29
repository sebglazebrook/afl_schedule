require 'spec_helper'

describe AFL::FixtureImporter do

  context 'team name given' do

    it 'returns a collection of games for that team in chronolical order' do
      matches = AFL::FixtureImporter.new(2013, 'Geelong').import
      matches.respond_to?(:size).should == true
      puts matches.first.inspect
      matches.first.time.should < matches[1].time
    end

  end

  context 'no team name given' do
    #@TODO
  end

end