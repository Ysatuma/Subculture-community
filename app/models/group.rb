class Group < ApplicationRecord
  belongs_to :genre
  has_many :hobbies
  has_many :group_users
  has_many :messages
  has_many :users, through: :group_users

end
