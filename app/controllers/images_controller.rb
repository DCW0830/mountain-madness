class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to root_path
    else
      gflash :now,  :error => "Image was not added. Please try again."
      render :new
    end
  end

  private

  def image_params
    # Rails.logger.debug params[:image][:image].inspect
    params.require(:image).permit(:name, :image)
  end
end
