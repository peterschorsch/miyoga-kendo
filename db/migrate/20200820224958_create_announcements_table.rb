class CreateAnnouncementsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
    	t.string :heading, :null => false
		t.text :description
		t.text :link

		t.boolean :pinned, :default => false
		t.boolean :archived, :default => false

		t.references :page, index: true, foreign_key: true
		t.references :user, index: true, foreign_key: true

		t.timestamps
    end
  end
end
