class CreateClassSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :class_schedules do |t|
      t.string :day_of_week, :null => false
      t.time :start_time, :null => false
      t.time :end_time, :null => false
      t.string :cost_per_month, :null => false

      t.references :address, index: true, foreign_key: true
      t.references :content, index: true, foreign_key: true

      t.timestamps
    end
  end
end
