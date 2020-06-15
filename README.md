# Subculture Community


# アプリ概要
  
  本アプリでは、「映画」「音楽」「イラスト」の３つのジャンルについて各コンテンツを閲覧、投稿(ログインユーザのみ、閲覧は非ログインユーザでも可能)できるWebアプリである。またジャンル毎に専用グループを作成することが出来、グループ内チャットとグループメンバーのみ閲覧可能なコンテンツを投稿可能である。



# 機能

  本アプリの主な機能は以下の通り


* ユーザ機能
  * 新規ユーザー作成
  * ユーザ情報編集
  * ログイン、ログアウト機能



* コンテンツ機能
  * ジャンル毎の投稿コンテンツリストを表示
  * 各コンテンツの再生及び表示
  * 「動画」のコンテンツ閲覧時、タイトル名に関連する動画をyoutubeから検索、表示
  * 各コンテンツをマイリストに登録又は削除(ログイン時のみ)
  * コンテンツを新規投稿可能



* マイリスト機能
  * マイリストに登録されたコンテンツをジャンル毎に表示
 


* グループ機能 
  * 新規グループ作成
  * 既存グループ情報編集(グループ名及びメンバーを変更可)
  * グループ内でのチャット機能
  * コンテンツ投稿機能(グループメンバーのみ閲覧可)



# ローカル環境での構築手順

* git cloneコマンドでローカルにコピーした後、DBを作成

  rails db:create

* その後各テーブルを作成

  rails db:miagrate

* 本アプリでは「映画」「音楽」「イラスト」の３種類がコンテンツの対象であるため、genre テーブルに「映画」「音楽」「イラスト」の順で入力しておく必要がある(入力手法については特に指定なし)。


# 開発環境

* OS バージョン：
  macOS catalina(version 10.15.4) 

* Ruby バージョン：
  ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin18]

* rails バージョン：
  Rails 5.2.4.3

* PostgreSQL バージョン：
  (PostgreSQL) 12.3


# データベース構成
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

