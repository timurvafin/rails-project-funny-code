require File.dirname(__FILE__) + '/test_unit_spec_helper'

describe "Test::Unit::TestCase" do
  it_should_behave_like "Test::Unit interop"
  it "should pass" do
    dir = File.dirname(__FILE__)
    run_script "#{dir}/testcase_spec_with_test_unit.rb"
  end
end