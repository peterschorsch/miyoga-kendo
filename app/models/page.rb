class Page < ApplicationRecord
	belongs_to :user
	has_many :contents

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
