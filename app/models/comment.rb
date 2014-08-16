class Comment < ActiveRecord::Base

  belongs_to :user, inverse_of: :comments
  belongs_to :post, inverse_of: :comments

  validates :content, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true

end
