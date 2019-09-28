class UserMailer < ApplicationMailer
	def forgotten_password_email(user)
	    @user = user
	    mail(to: @user.email, subject: 'Miyoga Kendo - Forgotten Password')
	end
end