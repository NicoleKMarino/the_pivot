class StartApplication < SimpleDelegator
  attr_reader :current_user,
              :outcome
  
  def initialize(job, bucket, current_user)    
    @job = job
    @bucket = bucket
    @current_user = current_user
    @outcome = "success"
    super(@bucket)
    applicant_has_account?
  end

  def applicant_has_account? 
    if current_user
      registered_user_can_apply?
    else
      job_application_already_in_bucket?
    end
  end

  def registered_user_can_apply?
    if user_already_applied?
      @outcome = "failed"
    else
      create_job_application
      JobApplication.last.update(user_id: current_user.id)
    end
  end
  
  def user_already_applied?
    JobApplication.where(user_id: @current_user.id, job_id: @job.id).exists?
  end
  
  def job_application_already_in_bucket?
    if check_bucket
      @outcome = "failed"
    else
      create_job_application
    end
  end
  
  def check_bucket
    bucket = @bucket.contents.keys.map do |job_app|
      JobApplication.find(job_app).job_id == @job.id
    end
    return true if bucket.include?(true)
  end
  
  def create_job_application
    @job.job_applications.create(
      summary: "Please write a brief paragraph explaining why you would be a good fit for this job."
    )
    @bucket.add_application(JobApplication.last)
  end
end