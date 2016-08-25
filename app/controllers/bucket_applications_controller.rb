class BucketApplicationsController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :set_job_application, only: [:update, :destroy]

  # def create
  #   @job = Job.find(params[:job_id])
  #   create_job_application
  #   @bucket.add_application(@job_application)
  #   session[:bucket] = @bucket.contents  
  #   flash[:success] = "You have started an application for #{@job.title}. You have started #{pluralize(@bucket.total_applications, 'job')} applications."
  #   redirect_based_on_user
  # end
  def create
    @job = Job.find(params[:job_id])
    StartApplication.new(@job, current_user)
    @bucket.add_application(JobApplication.last)
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
  
  private
  
    def set_job_application
      @job_application = JobApplication.find(params[:id])
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
    
    # def create_job_application
    #   if current_user
    #     create_registered_user_application 
    #   else
    #   @job_application = @job.job_applications.create(
    #     summary: "Please write a brief paragraph explaining why you would be a good fit for this job."
    #   )
    #   end
    # end
    # 
    # def create_registered_user_application
    #   @job_application = @job.job_applications.create(
    #     summary: "Please write a brief paragraph explaining why you would be a good fit for this job.",
    #     user_id: current_user.id
    #   )
    # end
end
