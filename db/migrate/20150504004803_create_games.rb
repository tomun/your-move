class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer:  :game_type_id,
      t.integer:  :player_1_id,
      t.integer:  :player_2_id,
      t.datetime: :game_started,
      t.datetime: :game_ended,
      t.string:   :game_data

      t.timestamps null: false
    end
  end
end
