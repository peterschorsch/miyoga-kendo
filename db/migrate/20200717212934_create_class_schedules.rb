class CreateClassSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :class_schedules do |t|
      t.string :day_of_week
      t.time :start_time
      t.time :end_time
      t.string :cost_per_month

      t.references :address, index: true, foreign_key: true

      t.timestamps
    end
  end
end
