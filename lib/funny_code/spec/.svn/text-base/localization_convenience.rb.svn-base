module FunnyCode
    module Spec
        module LocalizationConvenience
            LANG = :ru
   

            module Controller
                def localized_get(action, params = {})
                    get action, { :language => LANG}.update(params)
                end
        
                def localized_post(action, params = {})
                    post action, { :language => LANG}.update(params)
                end
        
                def localized_xhr(method, action, params = {})
                    xhr method, action, { :language => LANG}.update(params)
                end
        
            end
    
            module Example
                
                def localized_before_each(language = LANG)
                    before(:each) do
                        @language = language
                        assigns[:language] = language
                
                        yield
                    end
                end
        
                def setup_language(language = LANG)
                    assigns[:language] = language
                    @language = language
                end
            end
        end
    end
end