class Notification < ActiveRecord::Base

  belongs_to :user, inverse_of: :notifications, counter_cache: true
  belongs_to :post, inverse_of: :notifications, counter_cache: true

  validates :notif_user, presence: true 
  validates :action, presence: true
end
