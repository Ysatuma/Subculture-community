class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hobbies
  has_many :group_users  
  has_many :groups, through: :group_users      
  
  def self.search(search,id)
    return nil if (search.length == 0)
    User.where(['name LIKE(?)', "%#{search}%"] ).where.not(id: id).limit(10)
  end  
end
