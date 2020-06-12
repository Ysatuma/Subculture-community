class Hobby < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :favorite

  mount_uploader :content, ContentUploader
  mount_uploader :music, MusicUploader
  mount_uploader :illust, IllustUploader

  validates :title, :presence => true

  #マイリスト遷移時のコンテンツリストを作成する。
  def self.make_contents_list(hobbies, favorites)
    list = []    
    hobbies.each do |hobby|
      favorites.each do |favorite|
        if hobby.id == favorite.hobby_id
          list << hobby
          break
        end
      end
    end    
    return list
  end

  # ログイン時のコンテンツ登録リストを作成する。
  def self.make_favorite_list(hobbies, favorites)
    list = []
    result = 0
    hobbies.each do |hobby|
      favorites.each do |favorite|
        if hobby.id == favorite.hobby_id
          result =  favorite.id
          break
        else
          result = 0
        end
      end
      list << result
    end    
    return list
  end

end
