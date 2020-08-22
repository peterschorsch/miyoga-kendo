class Announcement < ApplicationRecord
	belongs_to :user
	belongs_to :page

	has_attached_file :image
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

	has_attached_file :pdf
	validates_attachment :pdf, content_type: { content_type: "application/pdf" }

	before_save :fix_link

	validates :heading, presence: true

	scope :pinned_news, -> {
		includes(:user).where(:pinned => true).by_recent_creation_date
	}

	scope :unpinned_news, -> {
		includes(:user).where(:pinned => false).by_recent_creation_date
	}

	scope :by_recent_creation_date, -> {
		order('created_at DESC')
	}

	scope :by_recent_update_date, -> {
		order('created_at ASC')
	}

	def fix_link
		self.link = !self.link.start_with?("http://", "https://") ? "http://" + self.link : self.link
	end

end
