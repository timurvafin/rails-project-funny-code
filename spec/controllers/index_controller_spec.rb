require File.dirname(__FILE__) + '/../spec_helper'

describe IndexController, "#route_for" do

    it "should map { :controller => 'index', :action => 'index' } to /" do
        route_for(:controller => "index", :action => "index").should == "/"
    end

end

describe IndexController, "handling GET /" do

    before(:each) do
        @code = Code.new
        
        @code_proxy.stub!(:paginate).and_return([@code])
        Code.stub!(:highly_ranked).and_return(@code_proxy)
        Code.stub!(:recent).and_return(@code_proxy)

        @new_code = Code.new
        Code.stub!(:new).and_return(@new_code)
    end

    def do_get
        localized_get :index
    end

    it "should be successfull" do
        do_get
        response.should be_success
    end

    it "should render index template" do
        do_get
        response.should render_template('index')
    end

    it "should create new code" do
        Code.should_receive(:new).and_return(@new_code)

        do_get
    end

    it "should find highly_ranked and recent codes" do
        Code.should_receive(:highly_ranked).and_return(@code_proxy)
        Code.should_receive(:recent).and_return(@code_proxy)
        @code_proxy.should_receive(:paginate).with(:page => 1).twice

        do_get
    end
end
