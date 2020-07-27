class ChangeLinksTable < ActiveRecord::Migration[5.2]
  def change
  	remove_column :links, :image_link, :string
  	remove_column :links, :display_logo, :boolean

  	add_reference :images, :link, index: true
  end
end
