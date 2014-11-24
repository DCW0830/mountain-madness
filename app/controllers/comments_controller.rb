class CommentsController < ApplicationController
  def index
    @comment = Comment.new
    @comments = Comment.all
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
