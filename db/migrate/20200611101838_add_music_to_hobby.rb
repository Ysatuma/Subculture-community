class AddMusicToHobby < ActiveRecord::Migration[5.2]
  def change
    add_column :hobbies, :music, :string
  end
end
