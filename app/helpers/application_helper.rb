module ApplicationHelper
  def admin_access(notenplan)
    user_notenplan = UserNotenplan.find_by(user: current_user, notenplan: notenplan)
    !user_notenplan.nil? && user_notenplan.admin
  end
end
