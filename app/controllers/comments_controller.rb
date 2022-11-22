class CommentsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post: @post)
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    if @comment.save
      railse
      redirect_to post_path(@post), notice: "Comment has been added"
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@comment.post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
