module BucketApplicationsHelper
  
  def redirect_based_on_user
    if current_user
      redirect_to edit_job_application_path(@job_application)
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
  
  def create_job_application
    if current_user
      create_registered_user_application 
    else
    @job_application = @job.job_applications.create(
      summary: "Please write a brief paragraph explaining why you would be a good fit for this job."
    )
    end
  end
  
  def create_registered_user_application
    @job_application = @job.job_applications.create(
      summary: "Please write a brief paragraph explaining why you would be a good fit for this job.",
      user_id: current_user.id
    )
  end
end
