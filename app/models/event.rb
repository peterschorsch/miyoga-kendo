class Event < ApplicationRecord
	belongs_to :address
	belongs_to :user
	belongs_to :page

	accepts_nested_attributes_for :address, :reject_if => proc { |attributes| attributes['address_line_1'].blank? || attributes['city'].nil? || attributes['state_id'].nil?|| attributes['zip_code'].nil? }

	validates :title, :start_date, :end_date, presence: true

	scope :of_page, -> (page) {
		where(page_id: page).references(:address)
	}

	scope :display_active, -> {
		where(:display => true).order_by_recent
	}

	scope :display_inactive, -> {
		where(:display => false).order_by_oldest
	}

	scope :order_by_recent, -> {
		order('start_date DESC')
	}

	scope :order_by_oldest, -> {
		order('start_date ASC')
	}
	
end
