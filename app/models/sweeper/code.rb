class Sweeper::Code < ActionController::Caching::Sweeper
    observe Code

    private

    def expire_cache_for(record)
        expire_page(highly_ranked_codes_path())
        expire_page(recent_codes_path())

        expire_page(code_comments_path(record))
    end
end
