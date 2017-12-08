class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  acts_as_votable()

  def comment_likes
    get_likes.size
  end
end
