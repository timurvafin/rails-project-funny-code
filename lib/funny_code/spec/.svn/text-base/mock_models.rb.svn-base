module FunnyCode
    module Spec
        module MockModels
            def mock_code(options = {})
                code = mock_model(Code, {:code => 'Code', :source => 'Source', :rank => 1}.update(options))
                code.stub!(:rankable?).and_return(true)
                code.stub!(:comments).and_return([])
                                    
                code
            end
        end
    end
end