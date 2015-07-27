class LandingController < ApplicationController

	def index
	  if !user_signed_in?
	    redirect_to new_user_session_path
	  else
	  	redirect_to requests_path
	  end 	
	end

	def create
		session["tos_confirmation"] = true
		redirect_to new_user_session_path
	end

	def require_tos
	  return true
	end

end
