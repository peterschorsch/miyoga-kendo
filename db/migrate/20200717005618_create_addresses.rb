class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :location_name, :null => false
      t.string :address_line_1, :null => false
      t.string :address_line_2
      t.string :city, :null => false
      t.string :state, :null => false, limit: 2
      t.string :zip_code, :null => false

      t.references :event, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
