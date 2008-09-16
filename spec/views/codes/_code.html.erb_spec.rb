require File.dirname(__FILE__) + '/../../spec_helper'

describe "/codes/_code.html.erb" do

    before(:each) do
        setup_language
        
        @code = mock_code(:code => 'Code', :source => 'Source')

        template.stub!(:code).and_return(@code)        
    end

    def do_render
        render 'codes/_code.html.erb'
    end

    it "should render code and code source" do
        do_render
        
        response.should have_tag("pre") do
            with_tag("code", @code.code)
        end
        response.body.should =~ Regexp.new(@code.source)
    end
end
