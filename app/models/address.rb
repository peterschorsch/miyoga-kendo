class Address < ApplicationRecord
	has_many :contacts
	has_many :events
	has_many :class_schedules
	belongs_to :state
end
