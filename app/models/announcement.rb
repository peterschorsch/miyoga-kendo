class Announcement < ApplicationRecord
	belongs_to :user
	belongs_to :page

	has_many :images, dependent: :destroy
	accepts_nested_attributes_for :images, allow_destroy: true

	has_attached_file :pdf
	validates_attachment :pdf, content_type: { content_type: "application/pdf" }, size: { in: 0..25.megabytes}

	before_save :fix_link

	validates :heading, presence: true

	scope :pinned_news, -> {
		includes(:user, :images).where(:pinned => true).by_recent_creation_date
	}

	scope :unpinned_news, -> {
		includes(:user, :images).where(:pinned => false).by_recent_creation_date
	}

	scope :active_news, -> {
		where(:archived => false)
	}

	scope :archived_news, -> {
		where(:archived => true)
	}

	scope :by_recent_creation_date, -> {
		order('created_at DESC')
	}

	scope :by_recent_update_date, -> {
		order('created_at ASC')
	}

	def fix_link
		if not self.link.nil?
			self.link = !self.link.start_with?("http://", "https://") ? "http://" + self.link : self.link
		end
	end

	def image_is_blank
		self.image.exists?
	end

	def self.reached_pinned_news_limit
		Announcement.pinned_news.count == 3
	end

end
