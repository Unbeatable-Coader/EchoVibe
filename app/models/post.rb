class Post < ApplicationRecord
  belongs_to :user
  belongs_to :user_detail
  has_one_attached :image

  validates :caption, presence: true
end
