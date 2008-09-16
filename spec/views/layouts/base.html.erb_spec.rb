require File.dirname(__FILE__) + '/../../spec_helper'

describe "/layouts/base.html.erb" do

    def do_render
        render 'layouts/base.html.erb'
    end
    
    before do
        setup_language
        
    	template.stub!(:render)
    end

    it "should render partial 'layouts/messages'" do
        template.should_receive(:render).with(:partial => 'layouts/messages')

        do_render
    end
end
