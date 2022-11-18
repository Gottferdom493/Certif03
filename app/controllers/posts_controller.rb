class PostsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path(@post)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:titre, :sujet, :url)
  end

end
