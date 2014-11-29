class ImagesController < ApplicationController
  respond_to :html, :json

  def new
    @image = Image.new
  end

  def index
    @images = Image.all
    respond_with @images
  end

  def create
    @trail = Trail.find(params[:trail_id])
    @image = current_user.images.new(image_params.merge(trail_id: @trail.id))
    if @image.save
      redirect_to :back
    else
      flash :now,  :error => "Image was not added. Please try again."
      render :back
    end
  end

  private

  def image_params
    params.require(:image).permit(:name, :image)
  end
end
