module Spec
  module Rails
    module Matchers  
      class ValidateLengthOf
        def initialize(attribute, range)
          @attribute = attribute
          @range = range
        end

        def matches?(model)
          @model = model
          
          if @range.first > 0
            @model.send "#{@attribute.to_s}=", 'a' * (@range.first - 1)
            return false if @model.valid? || !@model.errors.invalid?(@attribute)
          end
          
          @model.send "#{@attribute.to_s}=", 'a' * (@range.last + 1)
          return !@model.valid? && @model.errors.invalid?(@attribute)          
        end
      
        def failure_message
          "expected #{@model.class} to validate the length of #{@attribute} between #{@range.first} and #{@range.last}"
        end
        
        def description
          "validate the length of #{@attribute} between #{@range.first} and #{@range.last}"
        end
      end

      def validate_length_of(attribute, range)
        ValidateLengthOf.new(attribute, range)
      end
    end
  end
end
