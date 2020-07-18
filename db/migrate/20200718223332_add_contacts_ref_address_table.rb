class AddContactsRefAddressTable < ActiveRecord::Migration[5.2]
  def change
  	add_reference :contacts, :address, foreign_key: true
  end
end
