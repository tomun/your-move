class AddInvitationIdToGamesTable < ActiveRecord::Migration
  def change
    add_column :games, :invitation_id, :integer
  end
end
