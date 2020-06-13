class RemoveColumnsToHobby < ActiveRecord::Migration[5.2]
  def change
    remove_column :hobbies, :content
    remove_column :hobbies, :image
    remove_column :hobbies, :music
    remove_column :hobbies, :illust

  end
end
