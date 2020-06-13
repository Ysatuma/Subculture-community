class AddHobbyIdToIllust < ActiveRecord::Migration[5.2]
  def change
    add_reference :illusts, :hobby, foreign_key: true ,null:false
  end
end
