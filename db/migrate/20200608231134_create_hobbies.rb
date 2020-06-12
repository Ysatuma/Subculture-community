class CreateHobbies < ActiveRecord::Migration[5.2]
  def change
    create_table :hobbies do |t|
      t.string :title,    null: false, unique: true
      t.string :content,  null: false, unique: true
      t.string :image
      t.references :user, foreign_key: true
      t.references :genre, foreign_key: true
      t.timestamps
    end
  end
end
