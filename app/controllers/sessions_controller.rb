class SessionsController < ApplicationController
	skip_before_filter :require_login, except: :destroy

	def new
		@user = User.new
	end

	def create
		if @user = login(params[:email], params[:password])
			redirect_to sessions_path, notice: "Logged in!"
		else
			redirect_to sessions_path, notice: "Invalid"
		end
	end

	def destroy
		logout
		redirect_to(:root, notice: "Logged out")
	end

end
