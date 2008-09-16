module ActiveProject #:nodoc:
    module RubyExt #:nodoc:

        module String # :nodoc:
            # =Adds to String#to_permalink method
            # Formating String instance for url.
            # 
            module Conversions
                # * "Test string".to_permalink # => 'test-string'
                #
                def to_permalink
                    result = strip_tags

                    # preserve escaped octets
                    result.gsub!(/-+/, '-')
                    result.gsub!(/%([a-f0-9]{2})/i, '--\1--')

                    # Remove percent signs that are not part of an octet
                    result.gsub!('%', '-')

                    # Restore octets.
                    result.gsub!(/--([a-f0-9]{2})--/i, '%\1')

                    result.gsub!(/&.+?;/, '-') # kill entities
                    result.gsub!(/[^%a-z0-9_-]+/i, '-')
                    result.gsub!(/-+/, '-')
                    result.gsub!(/(^-+|-+$)/, '')

                    return result.downcase
                end

                private

                def strip_tags
                    return clone if blank?

                    if index('<')
                        text = ''
                        tokenizer = HTML::Tokenizer.new(self)

                        while token = tokenizer.next
                            node = HTML::Node.parse(nil, 0, 0, token, false)
                            # result is only the content of any Text nodes
                            text << node.to_s if node.class == HTML::Text
                        end
                        # strip any comments, and if they have a newline at the end (ie. line with
                        # only a comment) strip that too
                        text.gsub(/<!--(.*?)-->[\n]?/m, '')
                    else
                        clone # already plain text
                    end
                end
            end
        end
    end
end
