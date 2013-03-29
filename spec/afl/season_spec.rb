require 'spec_helper'
require 'ostruct'
require 'chronic'

describe AFL::Season do

  let(:yesterdays_match) { OpenStruct.new(:home_team => 'Essendon',
                                          :away_team => 'Melbourne',
                                          :venue => 'MCG',
                                          :time => Chronic.parse('yesterday')) }
  let(:tomorrows_match) { OpenStruct.new(:home_team => 'Essendon',
                                         :away_team => 'Hawthorn',
                                         :venue => 'Ethiad',
                                         :time => Chronic.parse('tomorrow')) }
  let(:matches) {[yesterdays_match, tomorrows_match]}

  before do
    AFL::FixtureImporter.any_instance.should_receive(:import).and_return(matches)
  end

  describe 'initialize' do

    context 'team name given' do

      it 'finds the teams schedule' do
        season = AFL::Season.new(2013, 'Essendon')
        season.instance_variable_get('@matches').should_not be nil
      end

    end

  end

  describe 'next_match' do

    let(:subject) { AFL::Season.new(2013, 'Essendon') }

    it 'returns the next match based on the date given' do

      subject.next_match.should == tomorrows_match
    end

  end

end