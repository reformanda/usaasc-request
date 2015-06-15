class LandingController < ApplicationController

	def set_confirmation
		session["tos_confirmation"] = true
	end

end
