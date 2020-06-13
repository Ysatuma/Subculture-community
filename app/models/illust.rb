class Illust < ApplicationRecord

  belongs_to :hobby

  mount_uploader :illust, IllustUploader

end
