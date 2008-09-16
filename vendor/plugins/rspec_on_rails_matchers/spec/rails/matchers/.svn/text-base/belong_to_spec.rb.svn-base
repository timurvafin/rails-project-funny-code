require File.dirname(__FILE__) + '/../../spec_helper'
require 'spec/rails/matchers/belong_to'

describe 'model.should belong_to' do
  include Spec::Rails::Matchers
  
  it 'should pass when model is contains association' do    
    model = mock(:model)
    model.class.should_receive(:reflect_on_association).with(:association).and_return(true)
    
    model.should belong_to(:association)
  end  
  
  it 'should fail when model doesnt contain association' do
    model = mock(:model)
    model.class.should_receive(:reflect_on_association).with(:association).and_return(nil)
    
    lambda {
      model.should belong_to(:association)
    }.should raise_error(Spec::Expectations::ExpectationNotMetError)
  end
end