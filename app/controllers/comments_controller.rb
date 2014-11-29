class CommentsController < ApplicationController
  before_filter :require_user, only: [:create]

  def index
    @comment = Comment.new
    @comments = Comment.last(20).reverse
  end

  def new
    @comment = Comment.new
  end

  def create
    @trail = Trail.find(params[:trail_id])
    @comment = current_user.comments.new(comment_params.merge(trail_id: @trail.id))

    if @comment.save
      redirect_to :back
    else
      render :back
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :trail_id)
  end


end
