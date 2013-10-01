module SessionSupport #we can call this helper in any test

	def setup_signed_in_user
		pass = "this-is-a-password"
		user = FactoryGirl.create :user, password: pass
		visit '/sessions/new'

		fill_in "email", with: user.email
		fill_in "password", with: password
		click_button "Login"
		# Return our user when this method is called
		user

		# No expectations are written
	end
end
