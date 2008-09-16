require File.dirname(__FILE__) + '/../../spec_helper'

require 'active_project/ruby_ext/time'

describe 'ActiveProject::RubyExt::TimeFreeze' do

    it 'should freeze time on current time in block and return current time out of the block' do
        Time.freeze_time do
            freezed_time = Time.now
            sleep(1)

            Time.now.should eql(freezed_time)
        end

        time = Time.now
        sleep(1)

        Time.now.should_not eql(time)
    end
end
