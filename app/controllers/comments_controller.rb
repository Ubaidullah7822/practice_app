class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
    puts "--------working in new"
  end

  def show
    @post = Post.find(params[:post_id])
    redirect_to post_comment_path(@post)
  end

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.includes(:user)
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if (@comment.save)
      redirect_to post_comments_path(@post)
    else
      render 'new'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
