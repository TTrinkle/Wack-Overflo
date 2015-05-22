class Question < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  has_many :comments, as: :commentable
  has_many :answers

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }
  validates_presence_of :user_id, :score

end
