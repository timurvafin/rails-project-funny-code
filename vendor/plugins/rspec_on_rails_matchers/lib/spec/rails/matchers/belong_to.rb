module Spec
  module Rails
    module Matchers  
      class BelongTo
        def initialize(association)
          @association = association
        end

        def matches?(model)
          @model = model
          !@model.class.reflect_on_association(@association).nil?          
        end
      
        def failure_message
          "expected #{@model.class} to belong to #{@association}"
        end
        
        def description
          "belong to #{@association}"
        end
      end

      def belong_to(association)
        BelongTo.new(association)
      end
    end
  end
end
