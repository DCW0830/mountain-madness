Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, twitter_API_KEY = ENV['TWITTER_KEY'], twitter_API_SECRET = ENV['TWITTER_SECRET'],
     {
        :secure_image_url => 'true',
        :image_size => 'original',
        :authorize_params => {
          :force_login => 'true',
          :lang => 'pt'
        }
      }
end
