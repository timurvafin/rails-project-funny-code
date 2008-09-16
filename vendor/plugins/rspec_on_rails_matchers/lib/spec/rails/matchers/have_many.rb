module Spec
  module Rails
    module Matchers  
      class HaveMany
        def initialize(association)
          @association = association
        end

        def matches?(model)
          @model = model
          !@model.class.reflect_on_association(@association).nil?          
        end
      
        def failure_message
          "expected #{@model.class} to have many #{@association}"
        end
        
        def description
          "have many #{@association}"
        end
      end

      def have_many(association)
        HaveMany.new(association)
      end
    end
  end
end
