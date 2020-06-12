class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name,  null: false, unique: true
      t.references :hobby, foreign_key: true
      t.references :genre, foreign_key: true
      t.timestamps
    end
  end
end
