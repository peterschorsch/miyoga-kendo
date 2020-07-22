class ClassSchedule < ApplicationRecord
	belongs_to :content

	default_scope { order(:day_of_week_index) }

end
