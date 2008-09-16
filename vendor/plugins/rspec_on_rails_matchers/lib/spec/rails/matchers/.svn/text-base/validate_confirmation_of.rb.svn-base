module Spec
  module Rails
    module Matchers  
      class ValidateConfirmationOf
        def initialize(attribute)
          @attribute = attribute
        end

        def matches?(model)
          @model = model
          @model.send "#{@attribute.to_s}_confirmation=", ''
          !@model.valid? && @model.errors.invalid?(@attribute)
        end
      
        def failure_message
          "expected #{@model.class} to validate the confirmation of #{@attribute}"
        end
        
        def description
          "validate the confirmation of #{@attribute}"
        end
      end

      def validate_confirmation_of(attribute)
        ValidateConfirmationOf.new(attribute)
      end
    end
  end
end
