class Event < ApplicationRecord
	belongs_to :address

	scope :order_by_recent, -> {
		order('start_date DESC')
	}

	scope :order_by_oldest, -> {
		order('start_date ASC')
	}
end
