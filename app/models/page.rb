class Page < ApplicationRecord
	belongs_to :user

	scope :active_pages, -> {
		where(:active => true)
	}

	scope :ordered, -> {
		order(:index)
	}

	def self.active_ordered_pages
		active_pages.ordered
	end

end
