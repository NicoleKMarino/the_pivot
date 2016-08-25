class Admin::BaseController < ApplicationController
  before_action :require_admin
  
  def require_admin
    unless @current_user.platform_admin?
      render file: '/public/404', status => 404, :layout => true
    end
  end
end
