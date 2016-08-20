class BucketController < ApplicationController

  def index
    @bucket_jobs = @bucket.all_items
  end
  
  def show
    @bucket_job = Job.find(params[:id])
  end
end
