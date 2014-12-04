class Api::V1::TrailsController < Api::V1::BaseController
  force_ssl unless Rails.env.development?

  before_action :authenticate, except: [:index, :show]

  respond_to :json, :xml

  def index
    respond_with Trail.all
  end

  def show
    respond_with Trail.find(params[:id])
  end

  def create
    respond_with Trail.create(trail_params)
  end

  def destroy
    respond_with Trail.destroy(params[:id])
  end

  def update
    respond_with Trail.update(params[:id], article_params)
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

  def authenticate
    authenticate_or_request_with_http_basic("Where's Your work visa?") do |nickname, oauth_secret|
      user = User.find_by(nickname: nickname)

      return true if user && user.oauth_secret == oauth_secret

      head :unauthorized
    end
  end
end
