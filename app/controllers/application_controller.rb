class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :verify_logged_in, :categories, :current_admin?
  before_action :industries
  before_action :set_bucket

  def set_bucket
    @bucket = Bucket.new(session[:bucket])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def verify_logged_in
    unless current_user
      flash[:danger] = "Please login to view this page"
      redirect_to login_path
    end
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def industries
    @industries = Industry.all
  end
end
