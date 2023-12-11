class UserDetail < ApplicationRecord
  has_many :post
  belongs_to :user
  belongs_to :post
end
