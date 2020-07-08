class Music < ApplicationRecord
  
  belongs_to :hobby
  
  mount_uploader :content, MusicUploader

  validates :content,  presence: true
end
