class CreateSocialMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :social_media do |t|
      t.string :site_name, :null => false
      t.string :site_link, :null => false
      t.string :image_link, :null => false

      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
