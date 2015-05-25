class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.text :body, null: false
    	t.integer :author_id, null: false
    	t.integer :question_id, null: false
    	t.integer :score, null: false, default: 0

    	t.timestamps
    end
  end
end
