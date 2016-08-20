class BucketController < ApplicationController

  def index
    @bucket_jobs = @bucket.all_jobs
  end
  
  def show
    @bucket_job = Job.find(params[:id])
  end
end
