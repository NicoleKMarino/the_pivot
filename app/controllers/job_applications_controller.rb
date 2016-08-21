class JobApplicationsController < ApplicationController
  
  def create
    @job_application = JobApplication.find(params[:id])
  end
  
  def show
    @job_application = Job.find(params[:id])
  end
  
  def edit
  end
  
  def update
    @job_application = Job.find(params[:id])
  end
end
