class Video < ApplicationRecord
  belongs_to :hobby

  mount_uploader :content, ContentUploader
end
