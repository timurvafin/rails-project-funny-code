require File.dirname(__FILE__) + '/../spec_helper'

describe "CodeControllerMethodsThatRenderNewCodeForm", :shared => true do
    it "should init new code and assign it to the view" do
    	new_code = Code.new
        Code.should_receive(:new).and_return(new_code)
        do_req
        
        assigns[:code].should == new_code
    end

    it "should be successful" do
        do_req
        response.should be_success
    end

end

describe "CodeControllerMethodsThatRenderNewCodeFormWithData", :shared => true do
    it "should init code with params and assign it to the view" do
        Code.should_receive(:new).with(@params).and_return(@code)
        do_req
        
        assigns[:code].should == @code
    end
end


describe CodesController, " handling GET /highly_ranked" do
    
    before(:each) do
        @code = mock_model(Code)
        @code_proxy.stub!(:paginate).and_return([@code])
        Code.stub!(:highly_ranked).and_return(@code_proxy)
    end

    def do_req
        localized_get :highly_ranked
    end

    it_should_behave_like "CodeControllerMethodsThatRenderNewCodeForm"

    it "should render highly_ranked template" do
        do_req
        response.should render_template('highly_ranked')
    end

    it "should find highly_ranked codes" do
        Code.should_receive(:highly_ranked).and_return(@code_proxy)
        @code_proxy.should_receive(:paginate).and_return([@code])
        
        do_req
    end

    it "should assign the found codes for the view" do
        do_req
        assigns[:codes].should == [@code]
    end
end


describe CodesController, " handling GET /highly_ranked.xml" do

    before(:each) do
        @code = mock_model(Code, :to_xml => "XML")
        @code_proxy.stub!(:paginate).and_return(@code)
        Code.stub!(:highly_ranked).and_return(@code_proxy)
    end

    def do_req
        @request.env["HTTP_ACCEPT"] = "application/xml"
        localized_get :highly_ranked
    end

    it_should_behave_like "CodeControllerMethodsThatRenderNewCodeForm"

    it "should find highly_ranked codes" do
        Code.should_receive(:highly_ranked).and_return(@code_proxy)
        @code_proxy.should_receive(:paginate).and_return(@code)
        
        do_req
    end

    it "should render the found codes as xml" do
        @code.should_receive(:to_xml).and_return("XML")
        do_req
        response.body.should == "XML"
    end
end


describe CodesController, " handling GET /recent" do

    before(:each) do
        @code = mock_model(Code)
        @code_proxy.stub!(:paginate).and_return([@code])
        Code.stub!(:recent).and_return(@code_proxy)
    end

    def do_req
        localized_get :recent
    end

    it_should_behave_like "CodeControllerMethodsThatRenderNewCodeForm"

    it "should render recent template" do
        do_req
        response.should render_template('recent')
    end

    it "should find recent codes" do
        Code.should_receive(:recent).and_return(@code_proxy)
        @code_proxy.should_receive(:paginate).and_return([@code])
        
        do_req
    end

    it "should assign the found codes for the view" do
        do_req
        assigns[:codes].should == [@code]
    end
end

describe CodesController, " handling GET /recent.xml" do

    before(:each) do
        @code = mock_model(Code, :to_xml => "XML")
        
        @code_proxy.stub!(:paginate).and_return(@code)
        Code.stub!(:recent).and_return(@code_proxy)
    end

    def do_req
        @request.env["HTTP_ACCEPT"] = "application/xml"
        localized_get :recent
    end

    it_should_behave_like "CodeControllerMethodsThatRenderNewCodeForm"

    it "should find recent codes" do
        Code.should_receive(:recent).and_return(@code_proxy)
        @code_proxy.should_receive(:paginate).and_return(@code)
        
        do_req
    end

    it "should render the found codes as xml" do
        @code.should_receive(:to_xml).and_return("XML")
        do_req

        response.should be_success
        response.body.should == 'XML'
    end
end


describe CodesController, " handling POST /codes.js" do

    before(:each) do
        @code = mock_model(Code, :save => true)
        Code.stub!(:new).and_return(@code)

        @params = { 'code' => 'Some code' }
    end

    def do_req
        @request.env["HTTP_ACCEPT"] = "application/js"
        localized_xhr :post, :create, :code => @params
    end

    it_should_behave_like "CodeControllerMethodsThatRenderNewCodeFormWithData"

    it "should create a new code and try to save them" do
        Code.should_receive(:new).with(@params).and_return(@code)
        @code.should_receive(:save).and_return(:true)

        do_req
    end

    it "should redirect to root url and setup success flash message" do
        do_req

        flash[:notice].should_not be_blank

        response.should be_success
        response.body.should =~ Regexp.new(request.host);
    end

end

describe CodesController, " handling POST /codes.js with invalid data" do
    before(:each) do
        @errors = mock_model(ActiveRecord::Errors, :full_messages => [])
        @code = mock_model(Code, :save => false, :errors => @errors)
        Code.stub!(:new).and_return(@code)

        @params = { 'code' => 'Some code' }
    end

    def do_req
        @request.env["HTTP_ACCEPT"] = "application/js"
        localized_xhr :post, :create, :code => @params
    end

    it_should_behave_like "CodeControllerMethodsThatRenderNewCodeFormWithData"

    it "should render code errors as xml" do
        @code.should_receive(:errors).and_return(@errors)

        do_req
        response.should be_success
        response.should have_rjs(:replace_html, 'dynamic-errors')
    end
end

describe CodesController, " handling POST /codes.xml" do

    before(:each) do
        @code = mock_model(Code, :save => true, :to_xml => 'XML')
        Code.stub!(:new).and_return(@code)

        @params = { 'code' => 'Some code' }
    end

    def do_req
        @request.env["HTTP_ACCEPT"] = "application/xml"
        localized_post :create, :code => @params
    end

    it_should_behave_like "CodeControllerMethodsThatRenderNewCodeFormWithData"

    it "should create a new code and try to save them" do
        Code.should_receive(:new).with(@params).and_return(@code)
        @code.should_receive(:save).and_return(:true)

        do_req
    end

    it "should render created code as xml" do
        @code.should_receive(:to_xml).and_return('XML')

        do_req
        response.body.should == 'XML'
        response.headers['Status'].should match(/^201/)
    end
end

describe CodesController, " handling POST /codes.xml with invalid data" do

    before(:each) do
        @code = mock_model(Code, :save => false, :to_xml => 'XML')
        Code.stub!(:new).and_return(@code)

        @params = { 'code' => 'Some code' }
    end

    def do_req
        @request.env["HTTP_ACCEPT"] = "application/xml"
        localized_post :create, :code => @params
    end

    it_should_behave_like "CodeControllerMethodsThatRenderNewCodeFormWithData"

    it "should render code errors as xml" do
        @code.should_receive(:errors)

        do_req
        response.headers['Status'].should match(/^422/)
    end
end

