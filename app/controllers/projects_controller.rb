class ProjectsController < ApplicationController

	def index 
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
	
	end

	def nav_state
		@nav = :projects
	end

	def project_params
    	params.require(:project).permit(:description, :goal, :teaser, :title, :user_id)
  end
end
