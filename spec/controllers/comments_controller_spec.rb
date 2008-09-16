require File.dirname(__FILE__) + '/../spec_helper'

module CommentsControllerSpecHelper

    def setup_before
        # new code 
        @new_comment = Comment.new

        # associated comments
        @comments = [mock_model(Comment)]
        @comments.stub!(:build).and_return(@new_comment)

        # existing code
        @code = mock_code
        @code.stub!(:comments).and_return(@comments)

        Code.stub!(:find).and_return(@code)
    end
end

describe "CommentsControllerMethods", :shared => true do
    it "response should be success" do
        do_req

        response.should be_success
    end

    it "should find code by code_id and assign it to the view" do
        Code.should_receive(:find).with(@code.id.to_s).and_return(@code)
        do_req

        assigns[:code].should == @code
    end

    it "should init new comment throw code.comments proxy and assign it to the view" do
        @comments.should_receive(:build).and_return(@new_comment)
        do_req

        assigns[:comment].should == @new_comment
    end

    it "should find all comments and assign it to  the view" do
        @code.should_receive(:comments).any_number_of_times.and_return(@comments)
        do_req

        assigns[:comments].should == @comments
    end
end

describe CommentsController, " handling GET /codes/1/comments" do
    include CommentsControllerSpecHelper

    before do
        setup_before
    end

    def do_req
        localized_get :index, :code_id => @code.id
    end

    it_should_behave_like "CommentsControllerMethods"

    it "should render list of comments" do
        do_req
        response.should render_template('index')
    end

end


describe CommentsController, "handling POST /codes/1/commets" do
    include CommentsControllerSpecHelper

    before do
        setup_before
        
        @params = { :name => 'Poster name', :comment => 'Some text' }
    end

    def do_req
        localized_post :create, :code_id => @code.id, :comment => @params
    end

    it "should try to save comment" do
        @new_comment.stub!(:save).and_return(true)
        @new_comment.should_receive(:save).and_return(true)
        do_req
    end

    it "should redirect to code_comments_path" do
        @new_comment.stub!(:save).and_return(true)
        do_req
        response.should redirect_to(code_comments_path(@code))
    end

    it "should render same view of failure" do
        @new_comment.stub!(:save).and_return(false)
        do_req
        response.should render_template('index')
    end
end

describe CommentsController, "handling POST /codes/1/commets.xml" do
    include CommentsControllerSpecHelper

    before do
        setup_before

        @code.stub!(:to_xml).and_return('XML')
        @params = { :name => 'Poster name', :comment => 'Some text' }
    end

    def do_req
        @request.env["HTTP_ACCEPT"] = "application/xml"
        localized_post :create, :code_id => @code.id, :comment => @params
    end

    it "should try to save comment" do
        @new_comment.stub!(:save).and_return(true)
        @new_comment.should_receive(:save).and_return(true)
        do_req
    end

    it "should render created comment as xml" do
        @new_comment.stub!(:save).and_return(true)
        @new_comment.should_receive(:to_xml).and_return('XML')

        do_req

        response.body.should == 'XML'
        response.headers['Status'].should match(/^201/)
    end

    it "should render errors as xml" do
        error = 'ERROR'
        error.should_receive(:to_xml).and_return('XML ERROR')

        @new_comment.stub!(:errors).and_return(error)
        @new_comment.stub!(:save).and_return(false)

        do_req
        response.body.should == 'XML ERROR'
    end
end
