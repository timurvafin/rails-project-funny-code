module ActiveProject #:nodoc:
    module RubyExt #:nodoc:
        module Time # :nodoc:

            # =Adds +time_freeze+ block to Time class
            #
            # Everything that is executed inside the freeze_time block executes with Time.now returning a set value.
            # Don't worry about @expected.date being different than the time on the new message.
            #
            # 	Time.freeze_time do 
            # 		@user = users(:mike)
            # 		@expected.date = Time.now
            #		assert_equal @expected.encoded, UserMailer.create_new_comment(@user).encoded    
            #	end

            module Freeze
                def self.included(klass) # :nodoc:
                    klass.extend(ClassMethods)
                end

                module ClassMethods # :nodoc:

                    def freeze_time(frozen_time = 946702800)
                        self.instance_eval do
                            frozen_now = (frozen_time)

                            alias :original_now :now
                            alias :now :frozen_now
                        end

                        if block_given?
                            begin
                                yield
                            ensure
                                unfreeze_time
                            end
                        end
                    end

                    def unfreeze_time
                        self.instance_eval do
                            alias :now :original_now
                        end    
                    end  

                    def frozen_now=(val)
                        @frozen_now = val
                    end

                    def frozen_now
                        self.at(@frozen_now || 946702800)
                    end
                end
            end

        end
    end
end
