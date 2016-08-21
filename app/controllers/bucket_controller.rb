class BucketController < ApplicationController

  def index
    @bucket_jobs = @bucket.all_jobs
  end
  
  def show
    @bucket_job = Job.find(params[:id])
    # redirect_to job_application_path(@bucket_job) unless current_user
  end
end
