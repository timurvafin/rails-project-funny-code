require File.dirname(__FILE__) + '/../../spec_helper'
require 'spec/rails/matchers/validate_confirmation_of'

describe 'model.should validate_confirmation_of' do
  include Spec::Rails::Matchers
  
  it 'should pass when model is invalid due to missing confirmation attribute' do
    errors = mock(:errors)
    errors.should_receive(:invalid?).with(:attribute).and_return(true)
    
    model = mock(:model)
    model.should_receive(:attribute_confirmation=).with('')
    model.should_receive(:valid?).and_return(false)
    model.should_receive(:errors).and_return(errors)
    
    model.should validate_confirmation_of(:attribute)
  end 
  
  it 'should fail when model is invalid but doesnt contain any errors on attribute' do
    errors = mock(:errors)
    errors.should_receive(:invalid?).with(:attribute).and_return(false)
    
    model = mock(:model)
    model.should_receive(:attribute_confirmation=).with('')
    model.should_receive(:valid?).and_return(false)
    model.should_receive(:errors).and_return(errors)
    
    lambda {
      model.should validate_confirmation_of(:attribute)
    }.should raise_error(Spec::Expectations::ExpectationNotMetError)
  end
  
  it 'should fail when model is valid' do
    model = mock(:model)
    model.should_receive(:attribute_confirmation=).with('')
    model.should_receive(:valid?).and_return(true)
    
    lambda {
      model.should validate_confirmation_of(:attribute)
    }.should raise_error(Spec::Expectations::ExpectationNotMetError)
  end
end