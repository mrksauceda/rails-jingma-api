class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  acts_as_votable()
  paginates_per 20
end
