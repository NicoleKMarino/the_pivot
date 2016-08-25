module ApplicationHelper
  def admin_edit?
    platform_admin?
  end

  def platform_admin?
    current_user && current_user.platform_admin?
  end

  def employer?
    current_user && current_user.employer?
  end
end
