class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer  :initiating_player
      t.integer  :recipient_player
      t.integer  :game_type_id
      t.boolean  :was_random_match
      t.datetime :challenge_issued
      t.datetime :challenge_expires
      t.datetime :challenge_responded
      t.boolean  :was_accepted

      t.timestamps null: false
    end
  end
end
