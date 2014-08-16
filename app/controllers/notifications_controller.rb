class NotificationsController < ApplicationController

  def index
    @notifs = Notification.where("seen=0 AND user_id=?", current_user.id)
    @notifs.each do |notif|
      notif.update_attribute(:seen, true)
    end
  end

  def show
    @notification = Notification.find(params[:id])
    @notifs = Notification.where("post_id=? AND seen=0", @notification.post_id)
    @notifs.each do |notif|
      notif.update_attribute(:seen, true)
    end
  end
end
