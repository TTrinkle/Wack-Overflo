class AddSelectedAnswerToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :selected_answer, :integer
  end
end
