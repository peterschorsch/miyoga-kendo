class Image < ApplicationRecord
	belongs_to :content, optional: true
	belongs_to :link, optional: true
	belongs_to :announcement, optional: true
	belongs_to :address, optional: true

    has_attached_file :image

    validates_attachment_content_type :image, :presence => true, :content_type => ["image/jpg", "image/jpeg", "image/png"]

    scope :search_by_file_name, -> (file_name) {
		where(:image_file_name => file_name)
	}
end
