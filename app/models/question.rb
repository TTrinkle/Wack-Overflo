class Question < ActiveRecord::Base
  acts_as_votable
  belongs_to :user, class_name: "User"
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }
  validates_presence_of :user_id, :score

  def rating
    self.get_upvotes.count - self.get_downvotes.count
  end

end
