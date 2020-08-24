class SocialMedium < ApplicationRecord
	belongs_to :user

	validates :site_name, :site_link, presence: true
	validates :site_name, :site_link, uniqueness: true

	has_attached_file :image
	validates_attachment_presence :image
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

	validate :fix_site_link

	def fix_site_link
		self.site_link = !self.site_link.start_with?("http://", "https://") ? "http://" + self.site_link : self.site_link
	end
end
