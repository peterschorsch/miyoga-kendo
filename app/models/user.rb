class User < ApplicationRecord
	include EmailValidator

	validates :firstname, :lastname, presence: true
	validates :email, presence: true, email: true, uniqueness: true
	has_secure_password

	validates :password, presence: true, length: { minimum: 8 }
	
	scope :active_users, -> {
		where(:active => true)
	}

	scope :archived_users, -> {
		where(:active => false)
	}

	def is_active?
		self.active
	end

	def is_archived?
		!self.archive
	end

	def concat_name
		self.firstname << " " << self.lastname
	end
end
