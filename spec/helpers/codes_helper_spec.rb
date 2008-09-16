require File.dirname(__FILE__) + '/../spec_helper'


describe CodesHelper, "#render_list_of_codes" do

    before do
        @codes = [mock_code, mock_code]
        stub!(:render)
    end

    it "should call render partial with collection when passing #render_list_of_codes without view_type" do
        should_receive(:render).with(:partial => 'codes/code_with_tools', :collection => @codes, :locals => {:view_type => nil})
        render_list_of_codes(@codes)
    end

    it "should call render partial with collection when passing #render_list_of_codes with view_type = 'recent'" do
        should_receive(:render).with(:partial => 'codes/code_with_tools', :collection => @codes, :locals => {:view_type => 'recent'})
        render_list_of_codes(@codes, 'recent')
    end

end

describe CodesHelper, "#render_new_code_form" do

    before do
        @code = mock_code
    end

    it "should call render partial 'codes/form' when passing #render_new_code_form" do
        should_receive(:render).with(:partial => 'codes/form', :locals => {:code => @code})
        render_new_code_form(@code)
    end
end

describe CodesHelper, "#render_code" do

    before do
        @code = mock_code
    end

    it "should call render partial 'codes/code' when passing #render_code" do
        should_receive(:render).with(:partial => 'codes/code')
        render_code(@code)
    end
end
