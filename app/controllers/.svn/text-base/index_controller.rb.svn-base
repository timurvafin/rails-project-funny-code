class IndexController < ApplicationController

    private

    public 

    def index
        @code = Code.new
        @codes_highly_ranked = Code.highly_ranked.paginate(:page => 1)
        @codes_recent = Code.recent.paginate(:page => 1)
    end

end
