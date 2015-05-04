class CreatePlayerGameTypes < ActiveRecord::Migration
  def change
    has_many :game_types
    create_table :player_game_types do |t|
      t.integer  :player_id,
      t.integer  :game_type_id

      t.timestamps null: false
    end
  end
end
