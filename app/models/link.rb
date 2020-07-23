class Link < ApplicationRecord
	belongs_to :content

	before_save :fix_link

	validates :name, :link, presence: true

	scope :ordered, -> {
		order(:index)
	}

	def fix_link
		self.link = !self.link.start_with?("http://", "https://") ? "http://" + self.link : self.link
	end
end
