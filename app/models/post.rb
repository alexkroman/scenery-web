class Post < ActiveRecord::Base
  attr_accessible :photo
  has_attached_file :photo, 
  :styles => { :original => '5000x5000>', :small => "300>x200" },
  :processors => [:auto_orient, :thumbnail],  
  :storage => :s3,
      :bucket => ENV['S3_BUCKET_NAME'],
      :s3_credentials => {
        :access_key_id => ENV['S3_KEY'],
        :secret_access_key => ENV['S3_SECRET']
      }
  validates_attachment_presence :photo
end
