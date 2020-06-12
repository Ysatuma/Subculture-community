class AddIllustToHobby < ActiveRecord::Migration[5.2]
  def change
    add_column :hobbies, :illust, :string
  end
end
