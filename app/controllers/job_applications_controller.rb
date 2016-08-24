class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [:show, :edit, :update]

  def show
  end
  
  def edit
  end
  
  def update
    if @job_application.update(job_application_params)
      UserJobApplication.new(@job_application, current_user)
      flash[:success] = "Your application was successfully submitted."
      @bucket.remove_application(@job_application)
      redirect_to dashboard_path
    else
      render :edit
    end
  end
  
  private
    
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    def job_application_params
      params.require(:job_application).permit(:summary, :education, :experience)
    end
end
