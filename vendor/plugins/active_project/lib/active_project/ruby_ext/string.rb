Dir[File.dirname(__FILE__) + "/string/*.rb"].each { |file| require(file) }

class String # :nodoc:
    include ActiveProject::RubyExt::String::Conversions
end

