class AddClassNameGameTypes < ActiveRecord::Migration
  def change
    add_column :game_types, :class_name, :string
  end
end
