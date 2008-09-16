require File.dirname(__FILE__) + '/../../spec_helper'

describe "/codes/_form.html.erb" do

    before(:each) do
        setup_language
        
        @code = Code.new
        template.should_receive(:code).any_number_of_times.and_return(@code)
    end

    def do_render
        render 'codes/_form.html.erb'
    end

    it "render new form" do
        do_render
        response.should have_tag("form[action=?][method=post]", codes_path) do
            with_tag("textarea#code_code[name=?]", "code[code]")
            with_tag("input#code_source[name=?]", "code[source]")
            with_tag("input[type=submit]")            
        end
    end
end