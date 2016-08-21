class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [:show, :edit, :update]

  def show
    @job_application = JobApplication.find(params[:id])
  end
  
  def edit
    @job_application = JobApplication.find(params[:id])
  end
  
  def update
    if @job_application.update(job_application_params)
      flash[:success] = "Your application was successfully submitted."
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
