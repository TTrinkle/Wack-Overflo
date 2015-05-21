class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.integer :author, null: false
    	t.text :body, null: false
    	t.references :commentable, polymorphic: true, index: true
    	
    	t.timestamps
    end
  end
end
