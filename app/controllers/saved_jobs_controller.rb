class SavedJobsController < ApplicationController
  before_action :set_job, only: [:create, :destroy]

  def create
    @saved_job = SavedJob.new(job_id: @job.id, user_id: current_user.id)
    if @saved_job.save
      flash[:success] = "You have saved #{@job.title} for later."
    else
      flash[:danger] = "You already saved that job"
    end
    redirect_to jobs_path
  end

  def destroy
    @saved_job = SavedJob.find_by(job_id: @job.id).destroy
    flash[:success] = "You have delete #{@job.title} from your saved jobs."
    redirect_to saved_jobs_path
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end
end
