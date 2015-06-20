class LandingController < ApplicationController




	def index
	end

	def create
		session["tos_confirmation"] = true
		redirect_to action: "index"
	end

	def require_tos
	  return true
	end

end
