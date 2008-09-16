ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'spec/rails/story_adapter'

Dir[File.join(File.dirname(__FILE__), "steps/*.rb")].each do |file|
    require file
end

def run_rails_story_file(file)
    run File.join(File.dirname(File.expand_path(file)), 'stories', File.basename(file).gsub('.rb', '')), :type => RailsStory
end