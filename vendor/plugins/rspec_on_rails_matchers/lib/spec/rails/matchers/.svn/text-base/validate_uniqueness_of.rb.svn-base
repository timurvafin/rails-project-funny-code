module Spec
  module Rails
    module Matchers  
      class ValidateUniquenessOf
        def initialize(attribute)
          @attribute = attribute
        end

        def matches?(model)
          @model = model.class.new(model.attributes.delete_if {|k,v| k == 'id' })  
          !@model.valid? && @model.errors.invalid?(@attribute)
        end
      
        def failure_message
          "expected #{@model.class} to validate the uniqueness of #{@attribute}"
        end
        
        def description
          "validate the uniqueness of #{@attribute}"
        end
      end

      def validate_uniqueness_of(attribute)
        ValidateUniquenessOf.new(attribute)
      end
    end
  end
end
