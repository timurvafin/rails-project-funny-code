module FunnyCode
    module I18n
        def self.included(base)
            # extend with class methods
            base.extend(ControllerClassMethods)

            # extend with instance method
            base.send(:include, ControllerInstanceMethods)
            base.hide_action(:on_no_lang_callback, :on_set_lang_callback)

            # add helper
            base.helper(Helpers)

            # setup lang autodetection
            base.autodetect_language_filter(
                :check_accept_header    => true,
                :on_no_lang             => :on_no_lang_callback,
                :on_set_lang            => :on_set_lang_callback
            )

            base.before_filter :redirect_to_localized_index
        end

        module ControllerClassMethods
        end

        module ControllerInstanceMethods

            private

            def redirect_to_localized_index
                redirect_to(localized_root_path) if request.path == root_path
            end

            public

            # on_no_lang_callback and on_set_lang_callback must be public. Hide them using hide_action

            # setup default locale same as config/initializers/i18n
            def on_no_lang_callback
                set_language GLoc.get_config(:default_language)
            end

            # setup cookie param and controller instance variable @language
            def on_set_lang_callback(language)
                cookies[GLoc.get_config(:default_cookie_name)] = language.to_s
                @language = language
            end

        end

        module Helpers
            def localized_error_messages_for(*params)
                options = params.extract_options!.symbolize_keys

                if object = options.delete(:object)
                    objects = [object].flatten
                else
                    objects = params.collect {|object_name| instance_variable_get("@#{object_name}") }.compact
                end
                count = objects.inject(0) {|sum, object| sum + object.errors.count }

                options = {
                    :object         => object,
                    :message        => l('common.error_messages_for.message'),
                    :header_message => lwr('common.error_messages_for.header_message', count)
                }.update(options)

                error_messages_for(params.first, options)
            end
        end
    end
end