class Video < ApplicationRecord
  belongs_to :hobby

  mount_uploader :content, ContentUploader

  validates :content, :thumb,  presence: true
end
