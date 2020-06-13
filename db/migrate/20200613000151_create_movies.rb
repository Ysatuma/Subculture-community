class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :content,  null: false
      t.string :thumb,  null: false
      t.timestamps
    end
  end
end
