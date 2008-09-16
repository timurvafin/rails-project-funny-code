module FunnyCode
    module CodeCache
        def self.included(base)
            base.extend(ClassMethods)
        end

        module ClassMethods
            def caches_action_with_code(*actions)
                actions = actions.inject({}) do |hsh, action|
                    action.is_a?(Hash) ? hsh.merge(action) : hsh.merge(action => { :after => :viewed_codes })
                end

                caches_action(actions)
            end
        end

   end
end