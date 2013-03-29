require 'spec_helper'
require 'ostruct'

describe AFL::Schedule do

  describe 'next_match' do

    let(:subject) { AFL::Schedule.new() }
    let(:season_response) { OpenStruct.new( :next_match => OpenStruct.new(:home_team => 'Essendon',
                                                            :away_team => 'Melbourne',
                                                            :venue => 'MCG',
                                                            :time => Time.new(2013, 04, 6, 19, 40, 0, '+10:00'))) }

    context 'no date given' do

      it 'returns the next match from now for the team given' do
        AFL::Season.should_receive(:new).with(2013, 'Essendon').and_return(season_response)
        result = subject.next_match('Essendon')
        result.home_team.should == 'Essendon'
        result.away_team.should == 'Melbourne'
        result.venue.should == 'MCG'
        result.time.should == Time.new(2013, 04, 6, 19, 40, 0, '+10:00')
      end

    end

    context 'date given' do

      it 'returns the next match for the team given after the given date' do
        #@TODO
      end

    end

  end

end
