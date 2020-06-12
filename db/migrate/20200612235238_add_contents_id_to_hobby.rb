class AddContentsIdToHobby < ActiveRecord::Migration[5.2]
  def change
    add_column :hobbies, :contents_id, :integer
  end
end
