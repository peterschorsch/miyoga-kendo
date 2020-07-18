class Content < ApplicationRecord
	belongs_to :page
	belongs_to :event, :optional => true
	has_many :class_schedules

	scope :of_page, -> (page) {
		where(page_id: page).references(:forms)
	}
end
