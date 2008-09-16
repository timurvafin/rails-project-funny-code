# This file is copied to ~/spec when you run 'ruby script/generate rspec' from
# the project root directory.
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'spec'
require 'spec/rails'

GLoc.set_config :default_language => FunnyCode::Spec::LocalizationConvenience::LANG
GLoc.load_localized_strings

Spec::Runner.configure do |config|
    config.use_transactional_fixtures = true
    config.use_instantiated_fixtures  = false
    config.fixture_path = RAILS_ROOT + '/spec/fixtures/'

    config.include(FunnyCode::Spec::MockModels)
    config.include(FunnyCode::Spec::LocalizationConvenience::Controller, :behaviour_type => :controller)
    
    include(FunnyCode::Spec::LocalizationConvenience::Example)
end