class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :heading
      t.string :subheading
      t.string :description
      t.integer :index, :null => false
      t.boolean :display, :default => false

      t.references :page, index: true, foreign_key: true

      t.timestamps
    end
  end
end