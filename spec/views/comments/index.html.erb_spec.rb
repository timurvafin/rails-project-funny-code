require File.dirname(__FILE__) + '/../../spec_helper'

describe "/comments/index.html.erb" do

    before(:each) do
        setup_language
        
        @comment = mock_model(Comment, :name => 'Name', :comment => 'Comment', :created_at => 'Date')
        @code = mock_code(:code => 'Code', :source => 'Source')
        assigns[:code] = @code
        assigns[:comments] = [@comment]
        
        template.stub!(:render_code)
        template.stub!(:localized_error_messages_for)
    end

    def do_render
        render 'comments/index.html.erb'
    end
    
    it "should render code" do
        template.should_receive(:render_code).with(@code)
        
        do_render
    end
    
    it "should render localized_error_messages_for" do
        template.should_receive(:localized_error_messages_for).with(:comment)
        
        do_render
    end
    
    it "should render form for new comment" do
        do_render
        
        response.should have_tag("form[action=?][method=post]", code_comments_path) do
            with_tag("input#comment_name[name=?]", "comment[name]")
            with_tag("textarea#comment_comment[name=?]", "comment[comment]")
            with_tag("input[type=submit]")            
        end
    end
    
    it "should render list of comments" do
        do_render
        
        response.should have_tag("blockquote", Regexp.new(@comment.comment))
        response.should have_tag("em", Regexp.new(@comment.name))
    end
    
    it "should render No data message if there is no comment yet" do
        assigns[:comments] = nil

        
        do_render
        response.body.should =~ Regexp.new(l('code.comments.no_data'))
        
    end
end
