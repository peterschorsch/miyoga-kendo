class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firstname, :null => false
      t.string :lastname, :null => false
      t.string :email, :null => false
      t.string :users, :password_digest

      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
