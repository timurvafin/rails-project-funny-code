class CommentsController < ApplicationController

    private

    def find_code
        @code = Code.find(params[:code_id])
    end

    def init_new_comment
        @comment = @code.comments.build(params[:comment])
    end

    def find_all_comments
        @comments = @code.comments
    end

    public

    before_filter :find_code, :init_new_comment, :find_all_comments

    # GET /codes/1/comments
    # GET /codes/1/comments.js
    def index
        @comments = @code.comments

        respond_to do |format|
            format.html
            format.xml  { render :xml => @comments }
        end
    end

    # POST /codes/1/comments
    def create
        respond_to do |format|
            if @comment.save
                format.html { redirect_to(code_comments_path(@code)) }
                format.xml  { render :xml => @comment, :status => :created }
            else
                format.html { render :action => 'index' }
                format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
            end
        end
    end
end