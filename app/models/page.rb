class Page < ApplicationRecord
	belongs_to :user
	has_many :contents
	has_many :class_schedules

	scope :active_pages, -> {
		where(:active => true)
	}

	scope :ordered, -> {
		order(:index)
	}

	scope :named, -> (name) {
		find_by(:name => name)
	}

	def self.active_ordered_pages
		active_pages.ordered
	end

end
