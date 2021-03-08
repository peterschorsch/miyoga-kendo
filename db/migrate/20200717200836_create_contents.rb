class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :heading, :null => false
      t.string :subheading
      t.text :description
      t.integer :index

      #t.boolean :display_content_on_page, :default => false
      t.boolean :archived, :default => false
      t.boolean :article, :default => false

      t.references :page, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
