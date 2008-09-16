GLoc.set_config({
    :default_param_name     => 'language',
    :default_cookie_name    => 'language',
    :default_language       => 'en'
})
GLoc.clear_strings_except :en, :ru
GLoc.load_localized_strings
