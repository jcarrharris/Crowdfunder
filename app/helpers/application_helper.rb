module ApplicationHelper
	def active_state
		if current_page?(projects_path)
		 	"active"
		elsif params[:id] && current_page?(project_path(params[:id]))
			"active"
		else
			""
		end 
	end
end
