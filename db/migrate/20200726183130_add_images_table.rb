class AddImagesTable < ActiveRecord::Migration[5.2]
  def change
  	create_table :images do |t|
      t.attachment :image

      t.references :content, index: true, foreign_key: true

      t.timestamps
    end
  end
end
