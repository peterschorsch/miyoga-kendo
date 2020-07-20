class Event < ApplicationRecord
	belongs_to :address

	scope :display_active, -> {
		where(:active => true).order_by_recent
	}

	scope :display_inactive, -> {
		where(:active => false).order_by_oldest
	}

	scope :order_by_recent, -> {
		order('start_date DESC')
	}

	scope :order_by_oldest, -> {
		order('start_date ASC')
	}

	
end
