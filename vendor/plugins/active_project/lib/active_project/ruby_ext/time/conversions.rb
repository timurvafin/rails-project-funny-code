module ActiveProject #:nodoc:
    module RubyExt #:nodoc:

        module Time # :nodoc:

            # =Adds to Time#to_s :word attribute
            # Formating Time instance for nice output.
            #
            module Conversions
                include ActionView::Helpers::DateHelper

                def self.included(klass) # :nodoc:
                    klass.send(:alias_method_chain, :to_s, :formatted_as_word)
                end

                # * Time.now.to_s(:word) -> Today
                # * 1.day.ago.to_s(:word) -> Yesterday
                # * 1.day.from_now.to_s(:word) -> Tomorrow
                # * Period from 10.days.ago -> N day(s) ago
                # * Other times -> Time.now.to_s(:long)

                def to_s_with_formatted_as_word(format = :default)
                    if format == :word
                        case self.to_date
                        when ::Time.now.to_date
                            return 'Today'
                        when 1.day.ago.to_date
                            return 'Yesterday'
                        when 1.day.from_now.to_date
                            return 'Tomorrow'
                        when 10.days.ago.to_date..::Time.now.to_date
                            return time_ago_in_words(self) + ' ago '
                        else
                            return to_date.to_s(:long)
                        end
                    else
                        to_s_without_formatted_as_word(format)
                    end
                end
            end
        end
    end
end
