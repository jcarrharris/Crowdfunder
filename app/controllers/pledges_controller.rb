class PledgesController < ApplicationController

	def new
		@pledge = @project.pledges.build
	end

	def create
		@pledge = @project.pledges.build params[:pledge]
		@pledge.user = current_user

		if @pledge.save
			redirect_to @project, notice: "Nice! Thanks for pledgeing $#{@pledge.amount} for this project."
		else
			render :new
		end
	end

	protected 

	def require_project
		@project = Project.find params[:project_id]
	end
	
end
