class ChangeAddressTable < ActiveRecord::Migration[5.2]
  def change
  	add_reference :addresses, :state, foreign_key: true
  	remove_column :addresses, :state, :string

  	add_column :addresses, :dojo_flag, :boolean, :default => false
  	add_column :addresses, :current_dojo_flag, :boolean, :default => false
  end
end
