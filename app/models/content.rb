class Content < ApplicationRecord
	belongs_to :page
	has_many :practices
	has_many :links, dependent: :destroy
	accepts_nested_attributes_for :links, allow_destroy: true#, :reject_if => proc { |attributes| attributes['address_line_1'].blank? || attributes['city'].nil? || attributes['state_id'].nil?|| attributes['zip_code'].nil? }

	validates :heading, presence: true
	validates_uniqueness_of :index, scope: :page_id, :if => :index_changed?
	validates :index, numericality: { greater_than: 0  }
	validate :strip_fields

	scope :of_page, -> (page) {
		where(page_id: page).references(:forms).display_ordered
	}

	scope :about_miyoga, -> {
		find_by(heading: "About Miyoga Kendo")
	}

	scope :display_ordered, -> {
		where(display_content_on_page: true).order(:index)
	}

	scope :order_by_index, -> {
		order(:index)
	}

	scope :only_logos, -> {
		includes(:links).where('links.display_logo' => true).where('links.article' => false).display_ordered
	}

	scope :only_articles, -> {
		includes(:links).where('links.article' => true).display_ordered
	}

	def strip_fields
		self.subheading = nil if self.subheading.blank?
		self.description = nil if self.description.blank?
	end

end
