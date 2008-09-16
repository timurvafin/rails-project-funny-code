require File.dirname(__FILE__) + '/../../spec_helper'

require 'active_project/ruby_ext/string'

describe 'String#to_permalink from ActiveProject::RubyExt::String::Conversions' do
    it 'should replace all punctuation marks and spaces with dashes' do
        "!.@#$\%^&*()Test case\n\t".to_permalink.should == 'test-case'
    end

    it 'should preserve _ symbol' do
        "Test_case".to_permalink.should == 'test_case'
    end

    it 'should preserve escaped octets and remove redundant %' do
        'Test%%20case'.to_permalink.should == 'test-%20case'
    end

    it 'should strip HTML tags' do
        '<a href="http://example.com">Test</a> <b>case</b>'.to_permalink.should == 'test-case'
    end

    it 'should strip HTML entities and insert dashes' do
        'Test&nbsp;case'.to_permalink.should == 'test-case'
    end

    it 'should trim beginning and ending dashes' do
        '-. Test case .-'.to_permalink.should == 'test-case'
    end

    it 'should not use ---aa--- as octet' do
        'b---aa---b'.to_permalink.should == 'b-aa-b'
    end

    it 'should replace % with -' do
        'Hello%world'.to_permalink.should == 'hello-world'
    end

    it 'should not modify original string' do
        s = 'Hello,&nbsp;<b>world</b>%20'
        s.to_permalink.should == 'hello-world%20'
        s.should == 'Hello,&nbsp;<b>world</b>%20'

        s = 'Hello'
        s.to_permalink.should == 'hello'
        s.should == 'Hello'
    end
end
