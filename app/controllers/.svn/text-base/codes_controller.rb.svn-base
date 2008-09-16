class CodesController < ApplicationController
    private

    def render_list_of_codes
        respond_to do |format|
            format.html
            format.xml  { render :xml => @codes }
        end
    end

    def init_new_code
        @code = Code.new(params[:code])
    end

    def create_success(code)
        flash[:notice] = l('code.successfully_created')

        render(:update) do |page|
            page.redirect_to(localized_root_url)
        end
    end

    public

    before_filter :init_new_code

    # GET /highly_ranked
    # GET /highly_ranked.xml
    def highly_ranked
        @codes = Code.highly_ranked.paginate(:page => params[:page])

        render_list_of_codes
    end

    # GET /recent
    # GET /recent.xml
    def recent
        @codes = Code.recent.paginate(:page => params[:page])

        render_list_of_codes
    end

    # POST /codes.js
    # POST /codes.xml
    def create
        respond_to do |format|
            if @code.save
                format.js { create_success(@code) }
                format.xml  { render :xml => @code, :status => :created }
            else
                format.js { render(:update) { |page| page.error(:list => @code.errors.full_messages) } }
                format.xml  { render :xml => @code.errors, :status => :unprocessable_entity }
            end
        end
    end
end
