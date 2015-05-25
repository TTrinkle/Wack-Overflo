class Answer < ActiveRecord::Base
  acts_as_votable
	belongs_to :question
	belongs_to :author, class_name: 'User'
	has_many :comments, as: :commentable
	has_many :votes, as: :votable


	validates :body, presence: true, length: { minimum: 2 }
	validates_presence_of :author_id, :score, :question_id

  def rating
    self.get_upvotes.count - self.get_downvotes.count
  end

end