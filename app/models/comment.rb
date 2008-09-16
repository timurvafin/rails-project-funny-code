class Comment < ActiveRecord::Base
    belongs_to :code

    validates_presence_of :code_id, :message => 'code.comments.errors.validates_presence_of_code_id'.to_sym
    validates_presence_of :comment, :message => 'code.comments.errors.validates_presence_of_comment'.to_sym

    validates_associated :code
    
    attr_accessible :name, :comment
end
