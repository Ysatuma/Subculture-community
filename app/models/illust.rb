class Illust < ApplicationRecord

  belongs_to :hobby

  mount_uploader :content, IllustUploader

end
