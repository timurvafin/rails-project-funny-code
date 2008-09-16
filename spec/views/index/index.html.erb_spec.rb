require File.dirname(__FILE__) + '/../../spec_helper'

describe "/index/index.html.erb" do

    def do_render
        render 'index/index.html.erb'
    end

    before(:each) do
        setup_language
        
        code_highly_ranked1 = mock_code(:code => 'Highly ranked1', :rank => 10, :id => 1)
        code_highly_ranked2 = mock_code(:code => 'Highly ranked2', :rank => 9, :id => 2)

        code_recent1 = mock_code(:code => 'Recent1', :rank => 1, :id => 3)
        code_recent2 = mock_code(:code => 'Recent2', :rank => 0, :id => 4)

        new_code = Code.new

        assigns[:code] = new_code
        assigns[:codes_highly_ranked] = [code_highly_ranked1, code_highly_ranked2]
        assigns[:codes_recent] = [code_recent1, code_recent2]

        template.stub!(:render_new_code_form)
        template.stub!(:render_list_of_codes)
    end

    it "should render form for new code" do
        template.should_receive(:render_new_code_form).with(assigns[:code])
        
        do_render
    end

    it "should render partial 'codes/code' with list of highly ranked and recent codes" do
        template.should_receive(:render_list_of_codes).with(assigns[:codes_highly_ranked], 'highly_ranked')
        template.should_receive(:render_list_of_codes).with(assigns[:codes_recent],'recent')

        do_render
    end
end
