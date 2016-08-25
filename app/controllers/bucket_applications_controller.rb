class BucketApplicationsController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :set_job_application, only: [:update, :destroy]

  def create
    @job = Job.find(params[:id])
    app = StartApplication.new(@job, @bucket, current_user)
    if app.outcome == "success"
      add_app_to_bucket
    else
      flash[:alert] = "You can't apply twice for the same job position."
    end
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

  private

    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end
    
    def add_app_to_bucket
      session[:bucket] = @bucket.contents
      flash[:success] = "You have started an application for #{@job.title}. \
      You have started #{pluralize(@bucket.total_applications, 'job')} applications."
    end
  
    def redirect_based_on_user
      if current_user
        redirect_to edit_job_application_path(JobApplication.last)
      else
        redirect_to bucket_path(@job)
      end
    end

    def redirect_based_on_referrer_button
      if params[:commit] == "Login or Create Account to Continue Application"
        redirect_to login_path
      else
        redirect_to jobs_path
      end
    end
end
