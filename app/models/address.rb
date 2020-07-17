class Address < ApplicationRecord
	has_many :contacts
	has_many :events
	belongs_to :state

	scope :find_current_dojo, -> {
		where("dojo_flag = ? AND current_dojo_flag = ?", true, true)
	}
end
