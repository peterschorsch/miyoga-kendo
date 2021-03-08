class User < ApplicationRecord
	has_many :pages, dependent: :destroy
	has_many :contents
	has_many :events
	has_many :announcements
	has_many :addresses
	has_many :links
	has_many :practices
	has_many :social_medium

	include EmailValidator

	validates :firstname, :lastname, presence: true
	validates :email, presence: true, email: true, uniqueness: true
	has_secure_password

	PASSWORD_FORMAT = /\A
		(?=.{8,})          # Must contain 8 or more characters
		(?=.*\d)           # Must contain a digit
		(?=.*[a-z])        # Must contain a lower case character
		(?=.*[A-Z])        # Must contain an upper case character
		(?=.*[[:^alnum:]]) # Must contain a symbol
	/x

	validates :password_digest, format: PASSWORD_FORMAT
	
	scope :active_accounts, -> {
		where(:active => true).remove_guest_account
	}

	scope :archived_accounts, -> {
		where(:active => false).remove_guest_account
	}

	scope :admin_accounts, -> {
		where(:role => "Admin")
	}

	scope :user_accounts, -> {
		where(:role => "User")
	}

	scope :order_by_name, -> {
		order(:lastname, :firstname, :email, :last_login)
	}

	scope :order_by_role, -> {
		order(:role, :lastname, :firstname, :email)
	}

	scope :remove_guest_account, -> {
		where.not(:role => "Guest", :firstname => "Not Logged In")
	}

	scope :order_by_last_login, -> {
		order('last_login desc').remove_guest_account
	}

	scope :get_guest_user, -> {
		find_by(:role => "Guest", :firstname => "Not Logged In")
	}

	scope :get_miyoga_user, -> {
		find_by(:dojo_account => true)
	}

	scope :remove_miyoga_user, -> {
		where(:dojo_account => false)
	}

	def get_dojo_address
		self.addresses.first
	end

	def is_logged_in?
		self.is_admin? || self.is_user?
	end

	def is_admin?
		self.role == "Admin"
	end

	def is_not_admin?
		self.role != "Admin"
	end

	def is_user?
		self.role == "User"
	end

	def is_guest?
		self.role == "Guest"
	end

	def is_not_guest?
		self.role != "Guest"
	end

	def is_dojo_account?
		self.dojo_account
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

	def dojo_address
		addresses.first
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
		self.new_user ? true : (self.reset_password_sent_at + 1.hour) > Time.zone.now
	end

	def reset_password!(password)
		self.reset_password_token = nil
		self.reset_password_sent_at = nil
		self.password_digest = User.digest(password)
		self.new_user = false
	end

	def send_forgotten_password_email
		self.generate_password_token! #generate pass token

	    # SEND EMAIL HERE
	    UserMailer.forgotten_password_email(self).deliver_later
	end

	# PASSWORD CONFIRMATION FIELDS
	def update_with_password(user_params)
		if self.authenticate(user_params[:current_password]) && user_params[:password] == user_params[:password_confirmation]
			self.password_digest = User.digest(user_params[:password])
			self.save
		else
			errors.add(:password_digest, " fields are incorrect.")
		end
	end

	def set_user_random_password
		self.password_digest = User.digest(generate_random_password)
	end

	private

	def generate_token
		SecureRandom.hex(10)
	end

	def generate_random_password
		SecureRandom.urlsafe_base64(8)<<"1!"
	end
end
