class AddWasWithdrawnToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :was_withdrawn, :datetime
  end
end
