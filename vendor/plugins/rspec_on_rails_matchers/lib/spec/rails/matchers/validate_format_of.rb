module Spec
  module Rails
    module Matchers  
      class ValidateFormatOf
        def initialize(attribute, options)
          @attribute = attribute
          
          @valid = options.fetch(:valid, [])
          @valid = [@valid] unless @valid.is_a? Array
          
          @invalid = options.fetch(:invalid, [])
          @invalid = [@invalid] unless @invalid.is_a? Array          
        end

        def matches?(model)
          @model = model
          
          @valid.each do |value|
            @model.send "#{@attribute.to_s}=", value
            return false unless @model.valid?
          end
          
          @invalid.each do |value|
            @model.send "#{@attribute.to_s}=", value
            return false if @model.valid? || !@model.errors.invalid?(@attribute)
          end  
          
          return true          
        end
      
        def failure_message
          "expected #{@model.class} to validate the format of #{@attribute}"
        end
        
        def description
          "validate the format of #{@attribute}"
        end
      end

      def validate_format_of(attribute, options)
        ValidateFormatOf.new(attribute, options)
      end
    end
  end
end
