class RatesController < ApplicationController

  include RatesHelper

  def create
    @post = Post.find(params[:post_id])
    @rate = Rate.new
    @rate.level = params[:i]
    @rate.post = @post
    @rate.user = current_user
    @rate.save
    len = Rate.where("post_id=?", @post.id).length
    new_level = ((@post.avg_rate*(len-1))+@rate.level)/len
    @post.update_attributes(avg_rate: new_level)
    @post.follow!(current_user)
    respond_to do |format|
      format.html{ redirect_to @rate }
      format.js
    end
  end

  def update
    @rate = Rate.find(params[:id])
    @post = @rate.post
    @rate.update_attributes(level: params[:i])
    new_level = 0.0
    @rates = Rate.where("post_id=?", @post.id)
    @rates.each do |rate|
      new_level = new_level + rate.level
    end
    new_level = new_level/@rates.length
    @post.update_attributes(avg_rate: new_level)
    respond_to do |format|
      format.html {redirect_to @rate}
      format.js
    end
  end

end
