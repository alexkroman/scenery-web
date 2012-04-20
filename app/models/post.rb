class Post < ActiveRecord::Base
  attr_accessible :photo
  has_attached_file :photo, 
  :styles => { :medium => "340>x600>" },
  :storage => :s3,
      :bucket => ENV['S3_BUCKET_NAME'],
      :s3_credentials => {
        :access_key_id => ENV['S3_KEY'],
        :secret_access_key => ENV['S3_SECRET']
      }
  validates_attachment_presence :photo
end
