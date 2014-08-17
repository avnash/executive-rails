class Rate < ActiveRecord::Base

  belongs_to :user, inverse_of: :rates
  belongs_to :post, inverse_of: :rates

  validates :level, uniqueness: {scope: [:user_id, :post_id]}
  validates :user_id, presence: true
  validates :post_id, presence: true

end
