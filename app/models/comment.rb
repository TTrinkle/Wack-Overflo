class Comment < ActiveRecord::Base
  has_many :comments, as: :commentable
  belongs_to :commentable
  belongs_to :author, class_name: "User"


  validates :body, presence: true, length: { minimum: 2, maximum: 160 }
  validates_presence_of :author_id

end
