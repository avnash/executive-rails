class AngersController < ApplicationController

  include AngersHelper

  def create
    @post = Post.find(params[:post_id])
    @anger = Anger.new
    @anger.level = params[:i]
    @anger.post = @post
    @anger.user = current_user
    @anger.save
    len = Anger.where("post_id=?", @post.id).length
    new_level = ((@post.avg_anger*(len-1))+@anger.level)/len
    @post.update_attributes(avg_anger: new_level)
    @post.follow!(current_user)
    respond_to do |format|
      format.html{ redirect_to @anger }
      format.js
    end
  end

  def update
    @anger = Anger.find(params[:id])
    @post = @anger.post
    @anger.update_attributes(level: params[:i])
    new_level = 0.0
    @angers = Anger.where("post_id=?", @post.id)
    @angers.each do |anger|
      new_level = new_level + anger.level
    end
    new_level = new_level/@angers.length
    @post.update_attributes(avg_anger: new_level)
    respond_to do |format|
      format.html {redirect_to @anger}
      format.js
    end
  end

end
