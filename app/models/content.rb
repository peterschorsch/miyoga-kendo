class Content < ApplicationRecord
	belongs_to :page
	has_many :class_schedules

	scope :of_page, -> (page) {
		where(page_id: page).references(:forms)
	}

	scope :display_ordered, -> {
		where(display: true).order(:index)
	}
end
