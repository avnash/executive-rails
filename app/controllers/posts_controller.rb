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
    time=(Time.now).strftime("%H-%M-%S_%d-%m-%Y")
    @post = Post.new
    @post.title = params[:post][:title]
    @post.content = params[:post][:content]
    @post.tag_ids = params[:post][:tag_ids]
    if params[:post][:file_link]
      uploaded_ios = params[:post][:file_link]
      full_link_array = ""
      uploaded_ios.each do |uploaded_io|
        link=uploaded_io.original_filename
        ext=File.extname(link)
        base=File.basename(link,ext)
        base=base+'_'+time
        full_link=base+ext
        full_link_array = full_link_array + full_link + "|"

        File.open(Rails.root.join('public', 'uploads', full_link), 'wb') do |file|
          file.write(uploaded_io.read)
        end
      end
      @post.file_link = full_link_array.at(0..-2)
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
     a=Post.find(params[:post_id]).file_link
     arr=a.split('|')
     link=arr[params[:file_no].to_i]
    send_file "#{Rails.root}/public/uploads/#{link}", disposition: 'inline' 
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
