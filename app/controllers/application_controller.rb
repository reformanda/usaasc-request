class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :tos_checked
  before_filter :require_tos
 

private
  def tos_checked
    @tos_checked = session["tos_confirmation"]
  end

  def require_tos
    unless tos_checked 
      redirect_to landing_index_path
      return false
    end
  end


end
