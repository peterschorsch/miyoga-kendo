class Practice < ApplicationRecord
	belongs_to :content
	belongs_to :user

	validates :day_of_week, :day_of_week_index, :start_time, :end_time, :cost_per_month, presence: true
	validate :update_cost_per_month, :start_time_exceed_end_time

	default_scope { order(:day_of_week_index, :start_time, :end_time) }

	def self.days_of_week_dropdown_options
		[['Sunday', 'Sunday'], ['Monday', 'Monday'], ['Tuesday', 'Tuesday'], ['Wednesday', 'Wednesday'], ['Thursday', 'Thursday'], ['Friday', 'Friday'], ['Saturday', 'Saturday']]
	end

	def update_cost_per_month
		Practice.where.not(:id => self.id).in_batches.update_all(cost_per_month: self.cost_per_month)
	end

	def start_time_exceed_end_time
		if start_time >= end_time
	      errors.add(:start_time, "can't end after the end time")
	    end
	end

end
