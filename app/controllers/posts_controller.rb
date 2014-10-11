class PostsController < ApplicationController

  include ApplicationHelper

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where("post_id = ?", params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    time=Time.now
    timeinteger=time.to_i
    timestring=timeinteger.to_s
    @post = Post.new
    @post.title = params[:post][:title]
    @post.content = params[:post][:content]
    @post.tag_ids = params[:post][:tag_ids]
    if params[:post][:file_link]
      uploaded_io = params[:post][:file_link]
      link=uploaded_io.original_filename
      ext=File.extname(link)
      base=File.basename(link,ext)
      base=base+timestring
      full_link=base+ext
       File.open(Rails.root.join('public', 'uploads', full_link), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      @post.file_link = full_link
    end

    @post.user = current_user
    tag_post @post
    if @post.save
     @post.tag_ids.each do |tag|
       @post.follow!(User.find_by(usertype: tag))
     end
     #PostMailer.post_notify(@user).deliver
      flash[:success] = "Successfully posted an article"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    if current_user.id != User.find(Post.find(params[:id]).user_id).id
      @notif = Notification.new
      @notif.user_id = User.find(Post.find(params[:id]).user_id).id
      @notif.post_id = Integer(params[:id])
      @notif.notif_user = current_user.id
      @notif.action = "has deleted your post with title '#{Post.find(params[:id]).title}'"
      @notif.save
    end
    @post = Post.find(params[:id])
    flash[:success] = "Succesfully deleted the post"
    respond_to do |format|
      format.html {redirect_to @post}
      format.js
    end
    @post.destroy
  end

  def get_file
    send_file "#{Rails.root}/public/uploads/#{Post.find(params[:post_id]).file_link}", type: 'application/pdf', disposition: 'inline' 
  end

  def update
    @post = Post.find(params[:id])
    @post.solved = true
    if @post.save
      @post.follows.each do |follow|
        if current_user.id!=follow.user_id
          @notif = Notification.new
          @notif.user_id = follow.user_id
          @notif.post_id = Integer(params[:id])
          @notif.notif_user = current_user.id
          @notif.action = "marked one of your following posts as solved"
          @notif.save
        end
      end
      flash[:success] = "Successfully marked the status of the post as solved."
      respond_to do |format|
        format.html {redirect_to @post}
        format.js
      end
    else
      flash[:error] = "Could not save the status of the post. Please try again."
    end
  end

#   def solved
#     @posts = Post.where("solved = ?", true)
#   end

  def search
    @posts = []
    #if params[:title]
      @posts_title = Post.search(params[:search], 'title')
      @posts = @posts + @posts_title
    #end
    #if params[:contents]
      @posts_contents = Post.search(params[:search], 'content' )
      @posts = @posts + @posts_contents
    #end
    #if params[:comments]
      @comments = Comment.where("content LIKE ?", "%#{params[:search]}%")
      @posts_comments = Post.find(@comments.uniq.pluck(:post_id))
      @posts = @posts + @posts_comments
    #end
  end

end
