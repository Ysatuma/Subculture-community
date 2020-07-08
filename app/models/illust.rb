class Illust < ApplicationRecord

  belongs_to :hobby

  mount_uploader :content, IllustUploader

  validates :content,  presence: true
end
