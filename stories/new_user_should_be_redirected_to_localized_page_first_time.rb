require File.join(File.dirname(__FILE__), *%w[helper])

with_steps_for :navigation, :html_mathers do
    Given("empty cookie") do

    end
    
    Given("empty accept language") do
        
    end
    
    run_rails_story_file(__FILE__)
end