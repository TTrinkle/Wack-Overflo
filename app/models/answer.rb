class Answer < ActiveRecord::Base
	belongs_to :question
	belongs_to :author, class_name: 'User'
	has_many :comments, as: :commentable
	has_many :votes, as: :votable


	validates :body, presence: true, length: { minimum: 2 }
	validates_presence_of :author_id, :score, :question_id
	
end