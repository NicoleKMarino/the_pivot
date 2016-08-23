class User::JobApplicationsController < ApplicationController
  def index
    @job_applications = JobApplication.where(user_id: current_user.id)
  end
  
  def show
    @job_application = JobApplication.find(params[:id])
  end
end
