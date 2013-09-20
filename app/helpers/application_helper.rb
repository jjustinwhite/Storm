module ApplicationHelper
	def navMainAktiv(actionName)
    if params[:controller] == actionName    
    "active"
    end
	end
end
