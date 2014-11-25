class CommentsController < ApplicationController
  before_filter :require_user, only: [:create]

  def index
    @comment = Comment.new
    @comments = Comment.last(20).reverse
  end

  def create

    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to comments_path
    else
      render :back
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end


end
