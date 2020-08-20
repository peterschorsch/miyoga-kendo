class AddImagesToLinks < ActiveRecord::Migration[5.2]
  def up
    add_attachment :links, :image
    remove_column :images, :link_id
  end

  def down
    remove_attachment :links, :image
    add_column :images, :link_id
  end
end
