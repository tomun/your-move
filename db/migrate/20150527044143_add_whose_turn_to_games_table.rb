class AddWhoseTurnToGamesTable < ActiveRecord::Migration
  def change
    add_column :games, :whose_turn, :integer
  end
end
