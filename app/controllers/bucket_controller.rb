class BucketController < ApplicationController
  def index
    @bucket_applications = @bucket.all_applications
  end
  
  def show
    @bucket_application = Job.find(params[:id]).job_applications.first
  end
end
