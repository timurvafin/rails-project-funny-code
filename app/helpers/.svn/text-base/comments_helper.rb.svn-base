module CommentsHelper
    def link_to_code_comments(code)
        length = code.comments.length
        text = length > 0 ? lwr('code.comment', length) : l('code.comments.no_data')
        link_to(text, code_comments_path(code))
    end
end
