class PostsController < ApplicationController
  def index
    user_id = params[:user_id]
    @posts = Post.where(user_id:)
  end

  def show
    user_id = params[:user_id]
    post_id = params[:id]
    @post = Post.find_by(user_id:, id: post_id)
  end
end
