class TrailsController < ApplicationController
  def index
  end

  def search
    @trails = Trail.search params[:search]
  end
end
