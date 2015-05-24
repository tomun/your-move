class DropPlayerGameTypeTable < ActiveRecord::Migration
  def change
    drop_table :player_game_types
  end
end
