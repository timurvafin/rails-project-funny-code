require File.dirname(__FILE__) + '/../spec_helper'
require 'active_project/rails_ext/regexp_format'

describe 'ActiveProject::RailsExt::RegexpFormat::DOMAIN' do
	it 'should match valid string' do
		ActiveProject::RailsExt::RegexpFormat::STRING.should match('validonelinestringwithoutspaces')
	end
	
	it 'should match valid email' do
		ActiveProject::RailsExt::RegexpFormat::EMAIL.should match('valid@email.com')
	end
		
	it 'should match valid domain' do
		ActiveProject::RailsExt::RegexpFormat::DOMAIN.should match('test.domain.com')
	end
		
	it 'should match valid domain anded at host' do
		ActiveProject::RailsExt::RegexpFormat::DOMAIN.should match('test.domain.host')
	end
end
