class Question < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  has_many :comments, as: :commentable

end
