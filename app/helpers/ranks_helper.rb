module RanksHelper
	# render remote link for ranking code up
    def link_to_code_rank_up(code, view_type = nil)
        link_to_remote(l('code.rank_up'), :url => code_rank_url(code, {:view_type => view_type}), :method => :post)
    end

	# render remote link for ranking code down
    def link_to_code_rank_down(code, view_type = nil)
        link_to_remote(l('code.rank_down'), :url => code_rank_url(code, {:view_type => view_type}), :method => :delete)
    end
end
