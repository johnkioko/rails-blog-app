class PostsController < ApplicationController
  def index
    @user = User.find(request.parameters[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to start_path
    else
      puts @post.errors.full_messages
    end
  end

  def show
    @post = Post.find(request.parameters[:id])
    @user = User.find(params[:user_id])
  end

  private

  def post_params
    params.require(:post).permit(:author, :title, :text)
  end
end
