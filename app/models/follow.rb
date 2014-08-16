class Follow < ActiveRecord::Base

  belongs_to :post, inverse_of: :follows
  belongs_to :user, inverse_of: :follows

  validates :user_id, presence: true
  validates :post_id, presence: true

end
