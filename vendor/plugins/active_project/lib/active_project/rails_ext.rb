Dir[File.dirname(__FILE__) + "/rails_ext/*.rb"].each { |file| require(file) }

ActionView::Helpers::PrototypeHelper::JavaScriptGenerator::GeneratorMethods.send(:include, ActiveProject::RailsExt::PrototypeFlashMessages)

unless (Kernel.const_get('ActiveRecord') rescue nil).nil?
	class ActiveRecord::Errors
		include ActiveProject::RailsExt::CustomErrorMessages
	end
end