require File.dirname(__FILE__) + '/../spec_helper'

describe RanksHelper, "link to rank action"  do
    before do
        @code = mock_code
        
        stub!(:link_to_remote)
        should_receive(:code_rank_url).with(@code, {:view_type => nil}).and_return('url')
    end

    it "should render link_to_remote when passing #link_to_code_rank_up" do
        should_receive(:link_to_remote).with(l('code.rank_up'), :url => 'url', :method => :post)

        link_to_code_rank_up(@code)
    end

    it "should render link_to_remote when passing #link_to_code_rank_down" do
        should_receive(:link_to_remote).with(l('code.rank_down'), :url => 'url', :method => :delete)

        link_to_code_rank_down(@code)
    end

end
