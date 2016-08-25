class StartApplication < SimpleDelegator
  attr_reader :current_user,
              :outcome
  
  def initialize(job, bucket, current_user)    
    @job = job
    @bucket = bucket
    @current_user = current_user
    @outcome = "success"
    super(@bucket)
    create_job_application
  end

  def create_job_application    
    if current_user
      create_registered_user_application 
    else
      job_application_already_in_bucket?
    end
  end

  def create_registered_user_application
    # if job_application_already_created?
      @job.job_applications.create(
        summary: "Please write a brief paragraph explaining why you would be a good fit for this job.",
        user_id: current_user.id
      ) 
      @bucket.add_application(JobApplication.last)
  end
  
  def job_application_already_in_bucket?
    if @job.job_applications.exists?
      @outcome = "failed"
    else
      @job.job_applications.create(
        summary: "Please write a brief paragraph explaining why you would be a good fit for this job."
      )
      @bucket.add_application(JobApplication.last)
    end
  end
  
end