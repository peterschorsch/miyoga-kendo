class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :name, :null => false
      t.string :link, :null => false
      t.string :image_link, :null => false

      t.references :content, index: true, foreign_key: true

      t.timestamps
    end
  end
end
