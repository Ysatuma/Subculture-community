class AddHobbyIdToVideo < ActiveRecord::Migration[5.2]
  def change
    add_reference :videos, :hobby, foreign_key: true ,null:false
  end
end
