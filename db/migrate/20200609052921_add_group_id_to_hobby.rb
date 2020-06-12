class AddGroupIdToHobby < ActiveRecord::Migration[5.2]
  def change
    add_column :hobbies, :group_id, :integer
  end
end
