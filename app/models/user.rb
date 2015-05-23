class User < ActiveRecord::Base
  has_secure_password

  has_many :questions
  has_many :answers, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author'
  has_many :votes, foreign_key: 'voter'

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  # validates :password_digest, presence: true

  def self.my_answers id 
  	Answers.where(author: id)
  end

  def self.my_comments id 
  	Comments.where(author: id)
  end

  def self.my_questions id 
  	Questions.where(author: id)
  end
end