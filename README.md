
* Ruby バージョン
  ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin18]

* OS バージョン
  macOS catalina(version 10.15.4) 

* データベース構成
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer| |
|name|string|null: false,unique: true|
|email|string|null: false,unique: true|
|encrypted_password|string|null: false|



### Association
- has_many :hobbies
- has_many :group_users  
- has_many :groups, through: :group_users  



## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer| |
|name|string|null: false,unique: true|
|genre_id|integer|null: false, foreign_key: true|



### Association
- belongs_to :genre
- has_many :hobbies
- has_many :messages
- has_many :group_users
- has_many :users, through: :group_users



## group-usersテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer| |
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|



### Association
- belongs_to :group
- belongs_to :user



## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer| |
|content|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|




### Association
- belongs_to :user
- belongs_to :group
- validates :content, presence: true



## hobbiesテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer| |
|title|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|genre_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|



### Association
- belongs_to :genre
- belongs_to :user
- has_one :video
- has_one :music
- has_one :illust
- has_many :favorite




## genresテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer| |
|name|string|null: false,unique: true|



### Association
- has_many :hobbies
- has_many :groups



## favoriteテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer| |
|name|string|null: false,unique: true|
|user_id|integer|null: false, foreign_key: true|
|hobby_id|integer|null: false, foreign_key: true|



### Association
- belongs_to :user
- belongs_to :hobby



## videosテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer| |
|content|string|null: false|
|hobby_id|integer|null: false, foreign_key: true|



### Association
- belongs_to :hobby  
- mount_uploader :content, VideoUploader



## musicテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer| |
|content|string|null: false|
|hobby_id|integer|null: false, foreign_key: true|



### Association
- belongs_to :hobby 
- mount_uploader :content, MusicUploader



## illustテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer| |
|content|string|null: false|
|hobby_id|integer|null: false, foreign_key: true|



### Association
- belongs_to :hobby
- mount_uploader :content, IllustUploader

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
