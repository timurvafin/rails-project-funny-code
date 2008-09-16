require File.dirname(__FILE__) + '/../spec_helper'

describe Comment do

    before(:each) do
        @code = mock_code
        @comment = Comment.new
    end

    it "should validate presents of :code_id" do
        @comment.should validate_presence_of(:code_id)
    end

    it "should validate presents of :comment" do
        @comment.should validate_presence_of(:comment)
    end

    it "should belong to code" do
        @comment.should belong_to(:code)
    end
    
    it "should protect :code_id on obj initialization" do
        @comment = Comment.new(:code_id => 10)
        @comment.code_id.should be_nil
    end

end
