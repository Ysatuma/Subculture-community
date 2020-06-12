class AllowNullToContentToHobby < ActiveRecord::Migration[5.2]
  def up
    change_column_null :hobbies, :content,  true
  end

  def down
    change_column_null :hobbies, :content,  false
  end
end
