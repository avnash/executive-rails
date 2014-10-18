class CommentMailer < ActionMailer::Base
  default from: "ch12b034@smail.iitm.ac.in"
 
  def comment_notify(recipient,comment)
    @commented_by = recipient
    @post = Post.find(comment.post_id)
    @comment = comment
    @post_by = User.find(@post.user_id)
    mail(to:recipient.username.downcase+"@smail.iitm.ac.in",subject:"New comments on "+@post.title.capitalize)
  end
end
