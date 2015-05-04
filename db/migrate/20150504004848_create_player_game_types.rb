class CreatePlayerGameTypes < ActiveRecord::Migration
  def change
    create_table :player_game_types do |t|
      t.integer:  :player_id,
      t.integer:  :game_type_id

      t.timestamps null: false
    end
  end
end
