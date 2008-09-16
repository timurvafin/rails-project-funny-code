class Code < ActiveRecord::Base

    class UnRankableException < RuntimeError; end

    has_many :comments,
        :class_name => 'Comment'

    validates_presence_of :code, :message => 'code.errors.validates_presence_of_code'.to_sym
    validates_numericality_of :rank, :only_integer => true, :message => 'code.errors.validates_numericality_of_rank'.to_sym
    
    attr_accessible :code, :source
    
    has_finder :highly_ranked, :order => 'rank DESC'
    has_finder :recent, :order => 'created_at DESC'

    private

    RANK_KEY = :ranks

    def save_rank_list(storage)
        storage[RANK_KEY] ||= []
        storage[RANK_KEY] << self.id
    end
    

    public

    def before_validation_on_create
        self.rank = 0 if self.rank.blank?
    end

    def rank_up(storage)
        raise UnRankableException.new unless rankable?(storage)

        update_attribute(:rank, rank + 1)
        save_rank_list(storage)
    end

    def rank_down(storage)
        raise UnRankableException.new unless rankable?(storage)

        update_attribute(:rank, rank - 1)
        save_rank_list(storage)
    end

    def rankable?(storage)
        return true if storage.blank? || storage[RANK_KEY].blank?
        return !storage[RANK_KEY].include?(self.id)
    end

#    class << self
#        def find_all_top(page = 1, per_page = 5)
#            paginate(:page => page, :per_page => per_page, :order => 'rank DESC')
#        end
#
#        def find_all_recent(page = 1, per_page = 5)
#            paginate(:page => page, :per_page => per_page, :order => 'created_at DESC')
#        end
#    end
end