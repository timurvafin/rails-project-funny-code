class RanksController < ApplicationController
    private

    def find_code
        @code = Code.find(params[:code_id])
    end

    def update_code_item
        view_type = params[:view_type].blank? ? nil : params[:view_type]

        render :update do |page|
            page.replace_html(dom_id(@code, view_type), :partial => 'codes/code_with_tools', :locals => {:code_with_tools => @code, :view_type => view_type})
        end
    end

    public

    before_filter :find_code

    # POST /codes/1/vote.js
    def create
        @code.rank_up(session)

        update_code_item
    end

    # DELETE /codes/1/vote.js
    def destroy
        @code.rank_down(session)

        update_code_item
    end
end
