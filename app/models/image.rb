class Image < ActiveRecord::Base
  has_attached_file :image, Paperclip::Attachment.default_options.dup
  belongs_to :user
  belongs_to :trail
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
