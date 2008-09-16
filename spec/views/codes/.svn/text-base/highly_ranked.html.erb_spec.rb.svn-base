require File.dirname(__FILE__) + '/../../spec_helper'

describe "/codes/highly_ranked.html.erb" do

    def do_render
        render "codes/highly_ranked.html.erb"
    end

    before do
        setup_language
        
        code_1 = mock_code(:code => 'Highly ranked code 1', :rank => '1')
        code_2 = mock_code(:code => 'Highly ranked code 2', :rank => '2')
        assigns[:codes] = [code_1, code_2]

        new_code = Code.new
        assigns[:code] = new_code

        template.stub!(:render_new_code_form)
        template.stub!(:render_list_of_codes)
        template.stub!(:will_paginate)
    end

    it "should render form for new code" do
       template.should_receive(:render_new_code_form).with(assigns[:code])
       do_render
    end

    it "should render list of codes" do
        template.should_receive(:render_list_of_codes).with(assigns[:codes])
        do_render
    end

    it "should render will_paginate pagination" do
        template.should_receive(:will_paginate).with(assigns[:codes])
        do_render
    end
end

