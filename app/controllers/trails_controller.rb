class TrailsController < ApplicationController
  def index
  end

  def search
    # binding.pry
    if params[:state].length > 0 && params[:city].length > 0
      @trails = Trail.search(params[:state], params[:city])
    elsif params[:city].empty?
      @trails = Trail.search(params[:state])
    else
      @trails = Trail.search(params[:city])
    end
  end
end
