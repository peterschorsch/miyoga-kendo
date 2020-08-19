class UserMailer < ApplicationMailer
	def forgotten_password_email(user)
		@user = user
	    mail(to: @user.email, subject: 'Miyoga Kendo - Forgotten Password')
	end

	def temporary_password_email(user)
		@user = user
	    mail(to: @user.email, subject: 'Miyoga Kendo - New Account Creation')
	end
end