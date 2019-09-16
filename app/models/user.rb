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

	def is_admin?
		self.role == "Admin"
	end

	def is_active?
		self.active
	end

	def is_archived?
		!self.archive
	end

	### DISPLAY METHODS ###
	def concat_name
		self.firstname << " " << self.lastname
	end

	def display_role
		self.is_admin? ? "Admin" : "User"
	end

	def display_active
		self.is_active? ? "Active" : "Archived"
	end
end
