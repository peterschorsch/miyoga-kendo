class ChangeEventsTable < ActiveRecord::Migration[5.2]
  def change
  	add_reference :events, :page, index: true
  end
end
