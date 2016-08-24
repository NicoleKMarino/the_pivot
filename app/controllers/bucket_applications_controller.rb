class BucketApplicationsController < ApplicationController
  include BucketApplicationsHelper
  include ActionView::Helpers::TextHelper

  def create
    @job = Job.find(params[:job_id])
    create_job_application
    @bucket.add_application(@job_application)
    session[:bucket] = @bucket.contents  
    flash[:success] = "You have started an application for #{@job.title}. You have started #{pluralize(@bucket.total_applications, 'job')} applications."
    redirect_based_on_user
  end

  def update
    @bucket.contents[params[:id]] = params[:summary]
    redirect_based_on_referrer_button
  end

  def destroy
    @application = JobApplication.find(params[:id])
    @bucket.contents.delete(params[:id])
    flash[:success] = "Your application for #{@application.job.title} has been cancelled."
    redirect_to bucket_index_path
  end
end
