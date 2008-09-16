# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
    # include all helpers, all the time
    helper :all

    # use 'layouts/base'
    layout 'base'

    # protect forms from CSRF attacks
    # TODO: ajax requiests brokes after first call
    #protect_from_forgery :secret => 'b7b03c489021'

    # add caches_action_with_code functionality	
    include FunnyCode::CodeCache

    # add i18n
    include FunnyCode::I18n
end
