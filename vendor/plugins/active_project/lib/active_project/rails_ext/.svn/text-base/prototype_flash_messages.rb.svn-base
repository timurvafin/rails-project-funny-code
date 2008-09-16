module ActiveProject #:nodoc:
    module RailsExt #:nodoc:
        module PrototypeFlashMessages

            # Default dom id for error block            
            ERROR_BLOCK_ID      = 'dynamic-errors'

            # Default dom id for success block            
            SUCCESS_BLOCK_ID    = 'dynamic-success'

            # Show custom error message in error block with :toggle_appear effect
            def error(options = '', element_ids = {})
                if element_ids.empty?
                    hide_message_blocks
                    show_message_block(ERROR_BLOCK_ID, options)
                else
                    hide element_ids[:error_block], element_ids[:success_block]
                    show_message_block(element_ids[:error_block], options)
                end
            end

            def success(options = '', element_ids = {})
                if element_ids.empty?
                    hide_message_blocks
                    show_message_block(SUCCESS_BLOCK_ID, options)
                else
                    hide element_ids[:error_block], element_ids[:success_block]
                    show_message_block(element_ids[:success_block], options)				    
                end
            end

            def destroy(id)
                hide_message_blocks
                visual_effect :fade, id
            end


            def hide_message_blocks(other_block_prefix = [])
                hide ERROR_BLOCK_ID, SUCCESS_BLOCK_ID

                other_block_prefix.each { |prefix| hide "#{prefix}-errors", "#{prefix}-success" }
            end

            def show_message_block(block_id, *options_for_render)
                unless options_for_render.blank?
                    if options_for_render.first.is_a?(Hash) && options_for_render.first.include?(:list)
                        replace_html block_id, '<ul>' + options_for_render.first[:list].collect{ |error| '<li>' + error + '</li>' }.join + '</ul>'
                    else
                        replace_html block_id, options_for_render
                    end
                end

                visual_effect :toggle_appear, block_id				
            end
        end
    end
end
