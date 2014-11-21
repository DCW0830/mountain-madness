unless Rails.env.test?
  Paperclip::Attachment.default_options.merge!(
    {
      storage: :s3,
      s3_credentials: {
        bucket: Rails.application.secrets.S3_BUCKET,
        access_key_id: Rails.application.secrets.S3_KEY_ID,
        secret_access_key: Rails.application.secrets.S3_ACCESS_KEY,
      },
      styles: {
        medium: "300x300>",
        thumb: "100x100>"
      },
      path: ":rails_env/:class/:id/:hash-:style.:extension",
      hash_secret: "wortham-is-the-man",
      url: ":s3_domain_url",
      default_url: "http://fillmurray.com/252/158"
    }
  )
  Paperclip::Attachment.default_options[:use_timestamp] = false
end

# http://stackoverflow.com/a/26285035
