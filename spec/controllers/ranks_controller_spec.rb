require File.dirname(__FILE__) + '/../spec_helper'

describe "RanksControllerMethods", :shared => true do
    it "response should be success" do
        do_post

        response.should be_success
    end

    it "should find code by code_id" do
        Code.should_receive(:find).with(@code.id.to_s).and_return(@code)
        do_post
    end

    it "should render rjs with replace_html for specific view type" do
    	view_type = 'highly_ranked'
    	
        do_post(view_type)
        response.should have_rjs(:replace_html, "#{view_type}_code_#{@code.id}", :partial => 'codes/code_with_tools', :locals => {:code_with_tools => @code, :view_type => view_type})
    end
    
    it "should render rjs with replace_html with empty view type" do
    	view_type = ''
    
        do_post(view_type)
        response.should have_rjs(:replace_html, "code_#{@code.id}", :partial => 'codes/code_with_tools', :locals => {:code_with_tools => @code, :view_type => view_type})
    end    
end

describe RanksController, " handling POST /codes/1/rank.js" do

    before do
        @code = mock_code
        @code.stub!(:rank_up)

        Code.stub!(:find).and_return(@code)
    end

    def do_post(view_type = nil)
        @request.env["HTTP_ACCEPT"] = "application/js"
        localized_xhr :post, :create, :code_id => @code.id, :view_type => view_type
    end

    it_should_behave_like "RanksControllerMethods"

    it "should vote up" do
        @code.should_receive(:rank_up).with(session)
        do_post
    end
end

describe RanksController, " handling DELETE /codes/1/rank.js" do

    before do
        @code = mock_code
        @code.stub!(:rank_down)

        Code.stub!(:find).and_return(@code)
    end

    def do_post(view_type = nil)
        @request.env["HTTP_ACCEPT"] = "application/js"
        localized_xhr :delete, :destroy, :code_id => @code.id, :view_type => view_type
    end

    it_should_behave_like "RanksControllerMethods"

    it "should vote down" do
        @code.should_receive(:rank_down).with(session)
        do_post
    end

end
