class Link < ApplicationRecord
	belongs_to :content, optional: true
	belongs_to :user
	has_one :image, dependent: :destroy
	accepts_nested_attributes_for :image, allow_destroy: true

	before_save :fix_link

	validates :name, :link, presence: true
	validates :name, :link, uniqueness: true, :if => :name_changed? || :link_changed?
	validates_uniqueness_of :index, scope: :content_id, :if => :index_changed?

	validates :index, numericality: { greater_than: 0 }

	scope :ordered, -> {
		order(:index)
	}

	def fix_link
		self.link = !self.link.start_with?("http://", "https://") ? "http://" + self.link : self.link
	end
end
