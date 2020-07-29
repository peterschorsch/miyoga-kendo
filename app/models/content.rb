class Content < ApplicationRecord
	belongs_to :page, optional: true
	has_many :practices

	has_many :links, inverse_of: :content, dependent: :destroy
	accepts_nested_attributes_for :links, allow_destroy: true#, :reject_if => proc { |attributes| attributes['address_line_1'].blank? || attributes['city'].nil? || attributes['state_id'].nil?|| attributes['zip_code'].nil? }

	has_many :images, inverse_of: :content, dependent: :destroy
	accepts_nested_attributes_for :images, allow_destroy: true

	validates :heading, presence: true
	validates_uniqueness_of :index, scope: :page_id, :if => :index_changed?
	validates :index, numericality: { greater_than: 0  }
	validate :strip_fields

	scope :of_page, -> (page) {
		where(page_id: page).references(:forms).active_ordered
	}

	scope :named, -> (text) {
		find_by(heading: text)
	}

	scope :about_miyoga, -> {
		find_by(heading: "About Miyoga Kendo")
	}

	scope :active_ordered, -> {
		where(display_content_on_page: true).order_by_index
	}

	scope :inactive_ordered, -> {
		where(display_content_on_page: true).order_by_index
	}

	scope :order_by_index, -> {
		order(:index)
	}

	### FOR RESOURCES PAGE ###
	scope :display_non_articles, -> {
		includes(:links).where('links.article' => false).active_ordered
	}

	scope :display_articles, -> {
		includes(:links).where('links.article' => true).active_ordered
	}

	scope :inactive_non_articles, -> {
		includes(:links).where('links.article' => false).inactive_ordered
	}

	scope :inactive_articles, -> {
		includes(:links).where('links.article' => true).inactive_ordered
	}

	def strip_fields
		self.subheading = nil if self.subheading.blank?
		self.description = nil if self.description.blank?
	end

end
