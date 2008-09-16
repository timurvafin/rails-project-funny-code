require File.dirname(__FILE__) + '/../spec_helper'

describe Code, "new object" do
    
    before(:each) do
        @code = Code.new
    end

    it "should validate presents of :code" do
        @code.should validate_presence_of(:code)
    end

    it "should validate numericality of :rank" do
        @code.rank = 'invalid rank'
        @code.should have(1).error_on(:rank)

        @code.rank = 1
        @code.should have(:no).errors_on(:rank)

        @code.rank = nil
        @code.should have(:no).errors_on(:rank)
    end

    it "should setup 0 rank by default" do
        lambda { @code.save }.should change(@code, :rank).to(0)
    end
    
    it "should protect :rank on obj initialization" do
        @code = Code.new(:rank => 10)
        @code.rank.should be_nil
    end

    it "should have many comments" do
        @code.should have_many(:comments)
    end
end

describe Code, "class methods" do
    
    before(:each) do
        @highly_ranked_code = Code.new(:code => 'Code with rank 10')
        @highly_ranked_code.created_at = 10.days.ago.to_date
        @highly_ranked_code.rank = 10
        @highly_ranked_code.save

        @recent_code = Code.new(:code => 'Recent code')
        @recent_code.created_at = 10.days.from_now.to_date
        @recent_code.save
    end

    it "should return highly ranked code when passing #highly_ranked" do
        Code.highly_ranked.first.should == @highly_ranked_code
    end

    it "should return recently added code when passing #recent" do
        Code.recent.first.should == @recent_code
    end

end

describe Code, "existing object" do

    before do
        @mock_session = {}

        @code = Code.create(:code => 'Sample code')
    end

    it "should change rank to -1 when passing #rank_down" do
        lambda { @code.rank_down(@mock_session) }.should change(@code, :rank).from(0).to(-1)
        @mock_session[:ranks].should include(@code.id)
    end

    it "should not change rank to -1 and raise error when passing #rank_down if code ranked before" do
        @mock_session[:ranks] = [@code.id]

        lambda { @code.rank_down(@mock_session) }.should raise_error(Code::UnRankableException)
        @code.should_not == -1
    end

    it "should change rank to 1 when passing #rank_up" do
        lambda { @code.rank_up(@mock_session) }.should change(@code, :rank).from(0).to(1)
        @mock_session[:ranks].should include(@code.id)
    end

    it "should not change rank to 1 and raise error when passing #rank_up if code ranked before" do
        @mock_session[:ranks] = [@code.id]

        lambda { @code.rank_up(@mock_session) }.should raise_error(Code::UnRankableException)
        @code.rank.should_not == 1
    end

    it "should return false when passing #rankable?" do
        @mock_session[:ranks] = [@code.id + 1]
        @code.rankable?(@mock_session).should be_true

        @mock_session[:ranks] = []
        @code.rankable?(@mock_session).should be_true

        @mock_session[:ranks] = nil
        @code.rankable?(@mock_session).should be_true

        @mock_session = nil
        @code.rankable?(@mock_session).should be_true
    end

    it "should return true when passing #rankable?" do
        @mock_session[:ranks] = [@code.id]
        @code.rankable?(@mock_session).should be_false
    end
end
