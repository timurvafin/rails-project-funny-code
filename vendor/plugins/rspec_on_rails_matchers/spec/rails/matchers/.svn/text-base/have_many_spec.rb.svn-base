require File.dirname(__FILE__) + '/../../spec_helper'
require 'spec/rails/matchers/have_many'

describe 'model.should have_many' do
  include Spec::Rails::Matchers
  
  it 'should pass when model is contains association' do    
    model = mock(:model)
    model.class.should_receive(:reflect_on_association).with(:association).and_return(true)
    
    model.should have_many(:association)
  end  
  
  it 'should fail when model doesnt contain association' do
    model = mock(:model)
    model.class.should_receive(:reflect_on_association).with(:association).and_return(nil)
    
    lambda {
      model.should have_many(:association)
    }.should raise_error(Spec::Expectations::ExpectationNotMetError)
  end
end