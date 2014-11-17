Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "iNgWm4eTzltC5NGOaxXlqD6p4", "OZdfW65SrSB2RDeROsPMROxkEtYofA7NiTWqQIj4kpFeTIqlSr",
    {
        :secure_image_url => 'true',
        :image_size => 'original',
        :authorize_params => {
          :force_login => 'true',
          :lang => 'pt'
        }
      }
end
