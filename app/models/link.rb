class Link < ApplicationRecord
	belongs_to :content, optional: true
	belongs_to :user
	has_many :images, inverse_of: :link, dependent: :destroy
	accepts_nested_attributes_for :images, allow_destroy: true

	before_save :fix_link

	validates :name, :link, presence: true
	validates :name, :link, uniqueness: true, :if => :name_changed? || :link_changed?
	validates :index, :uniqueness => { :scope => [:content_id, :article] }, :if => :index_changed?

	validates :index, numericality: { greater_than: 0 }

	scope :ordered, -> {
		order(:index)
	}

	def fix_link
		if not self.link.nil?
			self.link = !self.link.start_with?("http://", "https://") ? "http://" + self.link : self.link
		end
	end
end
