class User::JobApplicationsController < ApplicationController
  def index
    @job_applications = JobApplication.where(user_id: current_user.id)
  end
end
