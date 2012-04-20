class Post < ActiveRecord::Base
  attr_accessible :photo
  has_attached_file :photo, 
  :styles => { :medium => "300x300>" },
  :storage => :s3,
      :bucket => ENV['S3_BUCKET_NAME'],
      :s3_credentials => {
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
      }
  validates_attachment_presence :photo
end
