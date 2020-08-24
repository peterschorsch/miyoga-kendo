class ChangeSocialMediumTable < ActiveRecord::Migration[5.2]
  def up
  	remove_column :social_media, :image_link, :string

  	add_attachment :social_media, :image
  end

  def down
  	add_column :social_media, :image_link, :string

  	remove_attachment :social_media, :image
  end
end
