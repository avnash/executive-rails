class TagsController < ApplicationController

  def index
    @posts = Post.where("solved=?",false).reverse_order
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def display
    @tag = Tag.find(params[:id])
    @posts = Tag.includes(:posts).find(@tag.id).posts.where("solved=?", false)
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.name = params[:tags][:name]
    @tag.description = params[:tags][:description]
    @tag.save
    redirect_to :back
  end

end
