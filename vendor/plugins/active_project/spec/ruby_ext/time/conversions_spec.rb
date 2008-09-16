require File.dirname(__FILE__) + '/../../spec_helper'

require 'action_controller'
require 'active_project/ruby_ext/time'

describe 'ActiveProject::RubyExt::Time::Conversions' do
	it 'should return Today for today date' do
		Time.now.to_s(:word).should eql('Today')
	end

	it 'should return Yesterday for Yesterday date' do
		1.day.ago.to_s(:word).should eql('Yesterday')
	end

	it 'should return Tomorrow for Tomorrow date' do
		1.day.from_now.to_s(:word).should eql('Tomorrow')
	end

	it 'should return "5 days ago " when date is 5 days ago' do
		5.days.ago.to_s(:word).should eql('5 days ago ')
	end

	it 'should return date in :long format other times' do
		time = 30.days.ago

		time.to_s(:word).should eql(time.to_date.to_s(:long))
	end
end

