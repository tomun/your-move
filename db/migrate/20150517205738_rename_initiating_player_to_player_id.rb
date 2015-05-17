class RenameInitiatingPlayerToPlayerId < ActiveRecord::Migration
  def change
    rename_column :invitations, :initiating_player, :player_id
  end
end
