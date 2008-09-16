require File.dirname(__FILE__) + '/../spec_helper'

describe CommentsHelper, " link to code comments" do

    before do
        @code = mock_code
        
        stub!(:link_to)
        stub!(:code_comments_path).and_return('path')
    end

    it "should return link_to code_comments_path with pluralized name" do
        @code.stub!(:comments).and_return([1])
        should_receive(:link_to).with(lwr('code.comment', 1), 'path')

        link_to_code_comments(@code)
    end

    it "should return link_to code_comments_path with empty string" do
        @code.stub!(:comments).and_return([])
        should_receive(:link_to).with(l('code.comments.no_data'), 'path')

        link_to_code_comments(@code)
    end

end
