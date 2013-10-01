class ProjectsController < ApplicationController

	def index 
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
	
	end

	def project_params
    	params.require(:project).permit(:description, :goal, :teaser, :title, :user_id)
  end
end
