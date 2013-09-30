class UsersController < ApplicationController

	def new 
		@user = User.new

		respond_to do |format|
			format.html
			format.json {render json: @users}
		end
		
	end

	def create
		@user = User.create(params[:id])
		if @user.save
			auto_login(@user)
			format.html { redirect_to :root , notice: 'user was successfully created.' }
			format.json { render json: @user, status: :created, location: @user }
		else
			format.html { render action: "new" }
			format.json { render json: @user.errors, status: :unprocessable_entity }
		end
	end

				

end
