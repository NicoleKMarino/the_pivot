require 'pry'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :categories, :current_admin?
  before_action :authorize
  before_action :industries
  before_action :set_cart


  def set_cart
    @cart = Cart.new(session[:cart])
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

  def industries
    @industries = Industry.all
  end


  def authorize
    unless authorize?
      redirect_to root_url
    end
  end

  def authorize?
    PermissionService.new(current_user).allow?(params[:controller])
  end


end
