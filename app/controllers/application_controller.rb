class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def admin_access(notenplan)
    user_notenplan = UserNotenplan.find_by(user: current_user, notenplan: notenplan)
    !user_notenplan.nil? && user_notenplan.admin
  end


end
