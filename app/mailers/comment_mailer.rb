class CommentMailer < ActionMailer::Base
  default from: "ch12b034@smail.iitm.ac.in"
  def comment_notify(recipient,post)
    @recipient = recipient
    @post = post
    mail(to:recipient.downcase+"@smail.iitm.ac.in",subject:"New comments on "+post.title.capitalize)
  end
end
