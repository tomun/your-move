class AddHashToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :hash, :string
  end
end
