class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name, :null => false
      t.string :phone, :limit => 10
      t.string :email
      t.string :website
      t.text :notes

      t.boolean :club, :boolean, :default => false
      t.boolean :dojo_name, :boolean, :default => false
      t.boolean :dojo_location, :boolean, :default => false

      t.timestamps
    end

    remove_column :addresses, :location_name, :string
  end
end
