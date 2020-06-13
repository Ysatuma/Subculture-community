class AllowNullToThmub < ActiveRecord::Migration[5.2]
  def up
    change_column :videos, :thumb,:string, null: true # null: trueを明示する必要がある
  end

  def down
    change_column :videos, :thumb,:string, null: false
  end
end
