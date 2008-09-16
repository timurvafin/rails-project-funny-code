module CodesHelper
	# render list of codes with tools from code collection using specific view type
    def render_list_of_codes(codes, view_type = nil)
        render :partial => 'codes/code_with_tools', :collection => codes, :locals => {:view_type => view_type}
    end

	# render single code without tools
    def render_code(code)
        render :partial => 'codes/code'
    end

	# render form for adding code
    def render_new_code_form(code)
        render :partial => 'codes/form', :locals => {:code => code}
    end
end
