class RemoveHobbyIdFromGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :hobby_id, :integer
  end
end
