class Api::V1::TrailsController < Api::V1::BaseController
  def index
    respond_with Trail.all
  end
end
