module UsersHelper

	def user_nil_last_login(last_login)
		return nil_check(last_login) ? "n/a" : formateDateTimeWithAt(last_login)
	end
end
