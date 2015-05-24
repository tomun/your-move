class RenameHashInInvitations < ActiveRecord::Migration
  def change
    rename_column :invitations, :hash, :link_hash
  end
end
