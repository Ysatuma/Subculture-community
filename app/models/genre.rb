class Genre < ApplicationRecord
  has_many :hobbies
  has_many :groups
end
