module ApplicationHelper
 

  def tag_comment(comment)
   comment.content.scan(/\+[a-zA-Z]{2}[0-9]{2}[a-zA-Z]{1}[0-9]{3}/).each do |roll|
     @user = User.where("username=?", roll.strip[1..8].upcase).take
          @notif = Notification.new
          @notif.user_id = @user.id
          @notif.post_id = comment.post_id
          @notif.notif_user = current_user.id
          @notif.action = 'has tagged you in a comment'
	  @notif.save
	  TagMailer.tag_notify(@user.username,current_user.fullname).deliver
     comment.content.sub!(roll, "<a href='/users/#{@user.id}'>#{@user.fullname.capitalize}</a>")
   end
  end

  def tag_post(post)
   post.content.scan(/\+[a-zA-Z]{2}[0-9]{2}[a-zA-Z]{1}[0-9]{3}/).each do |roll|
     @user = User.where("username=?", roll.strip[1..8].upcase).take
          @notif = Notification.new
          @notif.user_id = @user.id
          @notif.post_id = post.id
          @notif.notif_user = current_user.id
          @notif.action = 'has tagged you in a post'
@notif.save
     post.content.sub!(roll, "<a href='/users/#{@user.id}'>#{@user.fullname.capitalize}</a>")
   end
  end
end
