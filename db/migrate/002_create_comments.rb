class CreateComments < ActiveRecord::Migration
    def self.up
        create_table :comments do |t|
            t.integer :code_id
            t.string :name
            t.text :comment

            t.timestamps 
        end
        add_index :comments, :code_id
    end

    def self.down
        drop_table :comments
    end
end
