class TagMailer < ActionMailer::Base
  default from: "ch12b034@smail.iitm.ac.in"

  def tag_notify(recipient,tagged_by,article,content="post")
    @recipient = recipient
    @tagged_by = tagged_by
    @content = content
    if @content == "post"
      @post = article.title
    else
      @comment = article.content
      @post = Post.find(article.post_id)
    end
    mail(to:@recipient+'@smail.iitm.ac.in',subject:'Executive Wing Portal')
  end
end
