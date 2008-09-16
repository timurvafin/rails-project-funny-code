steps_for(:navigation) do
    When("I open $path page") do |path|
        get_via_redirect path
    end
    
    Then("site should redirects to $path page") do |path|
        response.should redirect_to(path)
    end
end