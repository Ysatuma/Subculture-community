# Subculture Community


# アプリ概要
  
  本アプリでは、「映画」「音楽」「イラスト」の３つのジャンルについて各コンテンツを閲覧、投稿(ログインユーザのみ、閲覧は非ログインユーザでも可能)できるWebアプリである。またジャンル毎に専用グループを作成することが出来、グループ内チャットとグループメンバーのみ閲覧可能なコンテンツを投稿可能である。

  デプロイ先URL: https://subculture-community-for-pg.herokuapp.com/

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


# 本アプリの使い方

1. ログイン、新規登録
  未ログインの状態でアクセスした場合には「各ジャンルのコンテンツ閲覧」のみが可能なため、「コンテンツの投稿」や「グループの作成及び利用」をするためにはログインが必要となる。

  * 新規登録は、画面上部の一覧にある「新規登録」から必要事項を入力して行う。
  * ログインは、画面上部の一覧にある「ログイン」から必要事項を入力して行う。


![新規登録、ログインボタン](https://subculture-community-for-pg.herokuapp.com/assets/usage1.png)


2. コンテンツの閲覧
  ログイン状態にかかわらず、全てのユーザーが投稿済みのコンテンツを閲覧可能。

  * トップページから閲覧する場合は、ジャンルの選択肢が表示されるので閲覧したいジャンルをクリックすることで一覧を確認できる。また、画面上部の一覧にある「ジャンル」からも同様の操作ができる。

  * 各コンテンツを閲覧する際にログイン済みの場合、投稿者名の下部に「マイリスト登録/削除」ボタンが表示される。登録したコンテンツは、画面上部の一覧にある「マイリスト」から該当するジャンルを選択することでも閲覧できる。


3. コンテンツの投稿
  ユーザーログイン後、画面上部の一覧にある「マイリスト」から「コンテンツ投稿」を選択することでコンテンツが投稿できる。投稿できる各コンテンツの拡張子は以下の通り。

  * 映画：webm,mp4

  * 音楽：mp3,wav

  * イラスト：jpg,jpeg,gif,png


4. グループの作成、利用及び編集
  ユーザーログイン後、コンテンツ閲覧時に画面上部の一覧にある「グループ」から「新しいグループを作成」をクリックすると、必要事項を入力することで閲覧していたコンテンツと同じジャンルに関するグループを作成できる。作成されたグループは、「グループ」から確認することができる。

  * グループ名右側にある「コンテンツを投稿」から、コンテンツを投稿できる。投稿されたコンテンツはグループ専用となり2.の方法では閲覧出来ず、該当するグループ画面からのみ閲覧出来る。

  * グループ画面にはグループ用チャット機能があり、画面左下のフォームに記入後、「送信ボタン」をクリックすることでフォームの内容を発信できる。


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

