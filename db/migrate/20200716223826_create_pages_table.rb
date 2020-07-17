class CreatePagesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :name, :null => false

      t.string :path, :null => false
      t.string :index, :null => false, :limit => 2
      t.boolean :active, :default => true

      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
