class CommentsController < ApplicationController
  before_action :load_commentable
  def new
  end

  def show
    @comments = @commentable.comments
  end

  def index

    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def create
    comment = @commentable.comments.new(comment_params)
    comment.user_id = current_user.id
    if (comment.save)
      redirect_to book_path(@commentable)
    else
      render 'new'
    end
  end

  private
  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
  def comment_params
    params.require(:comment).permit(:body)
  end
end
