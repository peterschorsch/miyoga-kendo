class User < ApplicationRecord
	has_many :pages, dependent: :destroy

	include EmailValidator

	validates :firstname, :lastname, presence: true
	validates :email, presence: true, email: true, uniqueness: true
	has_secure_password

	validates :password, :confirmation => true, :length => {:within => 8..40}, :on => :update
	PASSWORD_FORMAT = /\A
		(?=.{8,})          # Must contain 8 or more characters
		(?=.*\d)           # Must contain a digit
		(?=.*[a-z])        # Must contain a lower case character
		(?=.*[A-Z])        # Must contain an upper case character
		(?=.*[[:^alnum:]]) # Must contain a symbol
	/x

	
	scope :active_users, -> {
		where(:active => true)
	}

	scope :archived_users, -> {
		where(:active => false)
	}

	scope :order_by_role, -> {
		order(:role, :lastname, :firstname, :email)
	}

	scope :order_by_last_login, -> {
		order('last_login desc')
	}

	def is_admin?
		self.role == "Admin"
	end

	def is_user?
		self.role == "User"
	end

	def is_active?
		self.active
	end

	def is_archived?
		!self.active
	end

	def update_last_login
		self.update_attribute(:last_login, DateTime.now)
	end

	### DISPLAY METHODS ###
	def concat_name
		self.firstname + " " + self.lastname
	end

	def display_role
		self.is_admin? ? "Admin" : "User"
	end

	def display_active
		self.is_active? ? "Active" : "Archived"
	end

	# Returns the hash digest of the given string.
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                                BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	def generate_password_token!
		self.reset_password_token = generate_token
		self.reset_password_sent_at = Time.zone.now
		save!(:validate => false)
	end

	def password_token_valid?
		(self.reset_password_sent_at + 1.hour) > Time.zone.now
	end

	def reset_password!(password)
		self.reset_password_token = nil
		self.password = password
		save
	end

	private

	def generate_token
		SecureRandom.hex(10)
	end
end
