module ApplicationHelper

  def tag_it(comment)
   comment.content.scan(/\+[a-zA-Z]{2}[0-9]{2}[a-zA-Z]{1}[0-9]{3}/).each do |roll|
     @user = User.where("username=?", roll.strip[1..8].upcase).take
     comment.content.sub!(roll, "<a href='/users/#{@user.id}'>#{@user.fullname.capitalize}</a>")
   end
  end

end
