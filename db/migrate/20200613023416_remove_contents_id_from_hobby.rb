class RemoveContentsIdFromHobby < ActiveRecord::Migration[5.2]
  def change
    remove_column :hobbies, :contents_id
  end
end
