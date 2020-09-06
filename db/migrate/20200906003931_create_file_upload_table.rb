class CreateFileUploadTable < ActiveRecord::Migration[5.2]
  def change
    create_table :file_uploads do |t|
    	t.attachment :pdf

		t.references :announcement, index: true, foreign_key: true

		t.timestamps
    end
  end
end
