module ApplicationHelper



  def admin_edit?
    platform_admin?
  end


  def new_user_path?
    request.path == new_user_path || formatted_referrer == new_user_path
  end


  def platform_admin?
    current_user && current_user.platform_admin?
  end

  def employer?
    current_user && current_user.employer?
  end

  private

  def formatted_referrer
    '/' + request.referrer.split('/')[-2..-1].join('/') if request.referrer
  end

end
