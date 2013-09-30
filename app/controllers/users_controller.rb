class UsersController < ApplicationController

	def new 
		@user = User.new

		respond_to do |format|
			format.html
			format.json {render json: @users}
		end
		
	end

	def create
		@user = User.new(user_params)
		if @user.save
			auto_login(@user)
			redirect_to :root, :notice => "Account created"
		else
			render "new"
		end
	end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
