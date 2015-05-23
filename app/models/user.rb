class User < ActiveRecord::Base
  has_secure_password

  has_many :questions
  has_many :answers, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author'
  has_many :votes, foreign_key: 'voter'

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  # validates :password_digest, presence: true

  def my_answers
    id = User.find_by(id: self.id)
  	Answer.where(author: id).count
  end

  def my_comments
    id = User.find_by(id: self.id)
  	Comment.where(author: id).count
  end

  def my_questions
    id = User.find_by(id: self.id)
  	Question.where(user: id).count
  end

  def my_unanswered_questions
    user = User.find_by(id: self.id)
    questions = Question.where(user: user)
    unanswered = questions.select {|question| question.answers.count == 0 }
    unanswered.count
  end
end