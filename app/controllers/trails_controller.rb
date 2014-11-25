class TrailsController < ApplicationController
  respond_to :html, :json
  def index
  end

  def search
    if params[:unique_id] == !nil
      @trail = Trail.search_id(params[:unique_id])
    elsif params[:state].length > 0 && params[:city].length > 0
      @trails = Trail.search(params[:state], params[:city])
      respond_with @trails
    elsif params[:city].empty?
      @trails = Trail.search_state(params[:state])
      respond_with @trails
    else
      @trails = Trail.search_city(params[:city])
      respond_with @trails
    end
  end

  def create
    @trail = current_user.trails.new(trail_params)
    if @trail.save
      flash[:notice] = "You have picked a favorite trail!"
      redirect_to :back
    else
      flash[:notice] = "Didn't work. Boo."
      redirect_to :back
    end
  end

  def trail_params
    params.require(:trail).permit(:unique_id)
  end
end
