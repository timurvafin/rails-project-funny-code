# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    def language_switcher
        links = []

        GLoc.valid_languages.map do |language|
            links << (current_language == language ? l(language) : link_to(l(language), localized_root_path(language)))
        end

        links * ' | '
    end
end
