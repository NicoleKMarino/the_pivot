class BucketApplicationsController < ApplicationController
  include BucketApplicationsHelper
  include ActionView::Helpers::TextHelper
  before_action :set_job_application, only: [:update, :destroy]

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
    @job_application.update_summary(params[:summary])
    redirect_based_on_referrer_button
  end

  def destroy
    @bucket.contents.delete(params[:id])
    flash[:success] = "Your application for #{@job_application.job.title} has been cancelled."
    redirect_to bucket_index_path
  end
  
  def set_job_application
    @job_application = JobApplication.find(params[:id])
  end
end
