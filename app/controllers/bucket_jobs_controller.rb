class BucketJobsController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :set_job, only: [:update, :destroy]

  def create
    job = Job.find(params[:job_id])
    @bucket.add_job(job.id)
    session[:bucket] = @bucket.contents
    flash[:success] = "You have started an application for #{job.title}. You have started #{pluralize(@bucket.total_jobs, 'job')} applications."
    redirect_to bucket_path(job) 
  end

  def update
    @bucket.contents[params[:id]] = params[:summary]
    check_button_for_redirect
  end

  def destroy
    @bucket.contents.delete(params[:id])
    flash[:success] = "Your application for #{view_context.link_to(@job.title, job_path(@job))} has been cancelled."
    redirect_to bucket_index_path
  end

  private

  def check_button_for_redirect
    if params[:commit] == "Login or Create Account to Continue Application"
      redirect_to login_path
    else
      redirect_to jobs_path
    end 
  end
  
  def set_job
    @job = Job.find(params[:id])
  end
end
