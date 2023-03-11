class CreateImagesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.attachment :image

      t.references :content, index: true, foreign_key: true
      t.references :announcement, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true

      t.timestamps
    end
  end
end
