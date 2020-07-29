class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title, :null => false
      t.text :description
      t.date :start_date, :null => false
      t.date :end_date, :null => false

      t.boolean :display, :default => true
      
      t.timestamps
    end
  end
end
