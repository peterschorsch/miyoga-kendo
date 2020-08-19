class AddNewUserFlag < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :new_user, :boolean, :default => true
  end
end
