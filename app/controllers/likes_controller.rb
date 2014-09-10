class LikesController < ApplicationController


  def create
    @post = Post.find(params[:post_id])
    @post.like!(current_user)
    respond_to do |format|
      format.html {redirect_to @post}
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.unlike!(current_user)
    respond_to do |format|
      format.html {redirect_to @post}
      format.js
    end
  end

end
