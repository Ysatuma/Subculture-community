class Music < ApplicationRecord
  
  belongs_to :hobby
  
  mount_uploader :content, MusicUploader
end
