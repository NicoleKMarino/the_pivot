module UsersHelper
  def verify_admin
    unless platform_admin? && current_user.id == params[:id].to_i
      if current_admin?
        flash[:danger] = "Admins can only modify their own accounts"
        redirect_to dashboard_path
      else
        render file: '/public/404', status => 404, :layout => true
      end
    end
  end
end
