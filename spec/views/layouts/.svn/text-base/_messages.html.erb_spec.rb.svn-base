require File.dirname(__FILE__) + '/../../spec_helper'

describe "/layouts/_messages.html.erb" do

    def do_render
        render 'layouts/_messages.html.erb'
    end

    it "should render invisible div#dynamic-errors with system error if flash[:error] is blank" do
        flash[:error] = nil
        do_render

        response.should have_tag("div#dynamic-errors[style=?]", "display:none", l('common.error'))
    end

    it "should render visible div#dynamic-errors with flash[:error]" do
        flash[:error] = 'error message'
        do_render

        response.should have_tag("div#dynamic-errors", 'error message')
    end

    it "should render invisible div#dynamic-success with success message if flash[:notice] is blank" do
        flash[:notice] = nil
        do_render

        response.should have_tag("div#dynamic-success[style=?]", "display:none", l('common.success'))
    end

    it "should render visible div#dynamic-success with flash[:notice]" do
        flash[:notice] = 'success message'
        do_render

        response.should have_tag("div#dynamic-success", 'success message')
    end


end
