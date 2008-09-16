require File.dirname(__FILE__) + '/../../spec_helper'

describe "/codes/_code_with_tools.html.erb" do

    before(:each) do
        setup_language
        
        @code = mock_code(:code => 'Code', :source => 'Source')

        template.stub!(:code_with_tools).and_return(@code)        
        template.stub!(:view_type).and_return('view_type')
        
        template.stub!(:link_to_code_rank_up)
        template.stub!(:link_to_code_rank_down)
        template.stub!(:link_to_code_comments)
    end

    def do_render
        render 'codes/_code_with_tools.html.erb'
    end

    it "should render links to rank up and down" do
        pending('example fails randomly, but work as single')        

        template.should_receive(:link_to_code_rank_up).with(@code, 'view_type')
        template.should_receive(:link_to_code_rank_down).with(@code, 'view_type')

        do_render
    end

    it "should render tag with dom_id" do
        pending('example fails randomly, but work as single')        

        do_render

        response.should have_tag("*[id=?]", "view_type_code_#{@code.id}")
    end

    it "should not render link_to_rank up and down if code unracable" do
        pending('example fails randomly, but work as single')
        
        @code.should_receive(:rankable?).exactly(2).times.and_return(false)

        template.should_not_receive(:link_to_code_rank_up)
        template.should_not_receive(:link_to_code_rank_down)

        do_render
    end

    it "should render link to comments" do
        pending('example fails randomly, but work as single')

        template.should_receive(:link_to_code_comments).with(@code)

        do_render
    end
end
