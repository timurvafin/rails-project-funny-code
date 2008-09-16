ActionController::Routing::Routes.draw do |map|

    # All paths should use language prefix
    map.with_options :path_prefix => ':language' do |localized|
        # List of highly ranked and recent codes All codes have many comments and rank
        # up(down) actions
        localized.resources :codes,
            :collection => { :highly_ranked => :get, :recent => :get },
            :has_one    => [ :rank ],
            :has_many   => [ :comments ]
    end

    # Root path /, we should alway redirect form here to localized index
    map.root :controller => 'index'
    
    # We should always use localized_root for links and redirect if we want to get root paht 
    map.localized_root ':language', :controller => 'index'

    # Install the default routes as the lowest priority.
    map.connect ':language/:controller/:action/:id'
    map.connect ':language/:controller/:action/:id.:format'

    # You can also define another set of default routes for when the locale is not in the params
    map.connect ':controller/:action/:id'
    map.connect ':controller/:action/:id.:format'
end
