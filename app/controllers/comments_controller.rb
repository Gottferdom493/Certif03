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
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      redirect_to post_comments_path(), notice: "Super, ton avis est rajouté!"
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
