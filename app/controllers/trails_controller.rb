class TrailsController < ApplicationController
  def index
  end

  def search
    @trails = Trail.search(params[:city]) 
  end
end
