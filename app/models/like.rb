class Like < ActiveRecord::Base
  belongs_to :post, inverse_of: :likes
  belongs_to :user, inverse_of: :likes

  validates :user_id, presence: true
  validates :post_id, presence: true
end
