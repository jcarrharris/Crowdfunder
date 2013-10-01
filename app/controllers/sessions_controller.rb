class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		if @user = login(params[:email], params[:password])
			redirect_to :root, notice: "Logged in!"
		else
			render 'new'
		end
	end

	def destroy
		logout
		redirect_to(:root, notice: "Logged out")
	end

end
