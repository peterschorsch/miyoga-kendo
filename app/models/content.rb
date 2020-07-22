class Content < ApplicationRecord
	belongs_to :page
	has_many :practices
	has_many :links

	validates :heading, presence: true
	validate :validate_index

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

	def validate_index
		page = self.page

		contents = Content.of_page(page).where.not(:id => self.id).select(:id, :index)
		contents.each do |content|
			errors.add(:index, "can't be the same as another entry") if self.index == content.index
		end
	end

end
