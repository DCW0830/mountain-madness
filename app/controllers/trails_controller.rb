class TrailsController < ApplicationController
  respond_to :js
  def index
  end

  def show
    source = Trail.find(params[:id])
    @trail = TrailDecorator.new(source)
    @comment = Comment.new
  end

  def search
    if params[:state].length > 0 && params[:city].length > 0
      Trail.search(params[:state], params[:city])
      @trails = Trail.where(state: params[:state].capitalize, city: params[:city].capitalize)
    elsif params[:city].empty?
      Trail.search_state(params[:state])
      @trails = Trail.where(state: params[:state].capitalize)
    else
      Trail.search_city(params[:city])
      @trails = Trail.where(city: params[:city].capitalize)
    end
  end

  def edit
    trail = Trail.find(params[:id])
    current_user.trails << trail
  end

  def create
    @trail = current_user.trails.find_or_create_by(unique_id: trail_params[:unique_id])
    @trail.update_attributes(trail_params)

    if @trail.valid?
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def trail_params
    params.require(:trail).permit(:unique_id,
                                  :distance,
                                  :description,
                                  :name,
                                  :city,
                                  :state,
                                  :lat,
                                  :lon,
                                  :directions,
                                  :rating,
                                  :url,
                                  :thumbnail
                                  )
  end
end
