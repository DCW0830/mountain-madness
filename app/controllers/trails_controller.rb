class TrailsController < ApplicationController
  respond_to :js
  def index
  end

  def search
    if params[:unique_id] == !nil
      @trail = Trail.search_id(params[:unique_id])
    elsif params[:state].length > 0 && params[:city].length > 0
      @trails = Trail.search(params[:state], params[:city])
    elsif params[:city].empty?
      @trails = Trail.search_state(params[:state])
    else
      @trails = Trail.search_city(params[:city])
    end
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
    params.require(:trail).permit(:unique_id)
  end
end
