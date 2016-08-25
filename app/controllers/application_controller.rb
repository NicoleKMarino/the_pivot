class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :categories, :platform_admin?
  before_action :authorize
  before_action :industries
  before_action :set_bucket

  def set_bucket
    @bucket = Bucket.new(session[:bucket])
  end

  def assign_bucket_applications_to_user
    @bucket.contents.keys.each do |job_application|
      application = JobApplication.find(job_application)
      application.assign_user(current_user)
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def verify_logged_in
    unless current_user
      flash[:danger] = "Please login to view this page!"
      redirect_to login_path
    end
  end

  def industries
    @industries = Industry.all
  end

  def authorize
    unless authorize?
      flash[:danger] = "Please login to view this page!"
      redirect_to root_url
    end
  end

  def authorize?
    PermissionService.new(current_user).allow?(params[:controller])
  end

  def salary_list
    @jobs = Job.all
    @jobs.map { |job| job.salary }.uniq
  end

  def location_list
    @companies.map { |company| company.location }.uniq
  end

  def industry_list
    @companies.map { |company| company.industry.name }.uniq
  end
end
