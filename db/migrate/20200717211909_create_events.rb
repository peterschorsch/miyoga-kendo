class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title, :null => false
      t.text :description, :null => false
      t.date :start_date, :null => false
      t.date :end_date, :null => false

      t.boolean :display, :default => true

      t.references :address, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
