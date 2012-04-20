class Post < ActiveRecord::Base
  attr_accessible :photo
  has_attached_file :photo, 
  :styles => { :original => '5000x5000>', :medium => "600x600>", :small => "320x320>", :thumb => "100x100#" },
  :processors => [:auto_orient, :thumbnail],  
  :storage => :s3,
      :bucket => ENV['S3_BUCKET_NAME'],
      :s3_credentials => {
        :access_key_id => ENV['S3_KEY'],
        :secret_access_key => ENV['S3_SECRET']
      }
  validates_attachment_presence :photo
end
