class ChangeAddressTable < ActiveRecord::Migration[5.2]
  def change
  	add_reference :addresses, :state, foreign_key: true
  	remove_column :addresses, :state, :string
  end
end
