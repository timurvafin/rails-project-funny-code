module Spec
  module Rails
    module Matchers  
      class ValidatePresenceOf
        def initialize(attribute)
          @attribute = attribute
        end

        def matches?(model)
          @model = model
          @model.send "#{@attribute.to_s}=", nil
          !@model.valid? && @model.errors.invalid?(@attribute)
        end
      
        def failure_message
          "expected #{@model.class} to validate the presence of #{@attribute}"
        end
        
        def description
          "validate the presence of #{@attribute}"
        end
      end

      def validate_presence_of(attribute)
        ValidatePresenceOf.new(attribute)
      end
    end
  end
end
