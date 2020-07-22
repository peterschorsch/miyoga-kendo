class Event < ApplicationRecord
	has_one :address
	accepts_nested_attributes_for :address, :reject_if => proc { |attributes| attributes['address_line_1'].blank? || attributes['city'].nil? || attributes['state_id'].nil?|| attributes['zip_code'].nil? }

	validates :title, :start_date, :end_date, presence: true

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
