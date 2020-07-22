class Content < ApplicationRecord
	belongs_to :page
	has_many :practices
	has_many :links

	scope :of_page, -> (page) {
		where(page_id: page).references(:forms).display_ordered
	}

	scope :about_miyoga, -> {
		find_by(heading: "About Miyoga Kendo")
	}

	scope :display_ordered, -> {
		where(display: true).order(:index)
	}

	scope :only_logos, -> {
		includes(:links).where('links.display_logo' => true).where('links.article' => false).display_ordered
	}

	scope :only_articles, -> {
		includes(:links).where('links.article' => true).display_ordered
	}
end
