class StartApplication
  attr_reader :current_user
  
  def initialize(job, current_user)    
    @job = job
    @current_user = current_user
    create_job_application
  end

  def create_job_application    
    if current_user
      create_registered_user_application 
    else
      @job.job_applications.create(
      summary: "Please write a brief paragraph explainiing why you would be a good fit for this job."
    )
    end
  end

  def create_registered_user_application
      @job.job_applications.create(
      summary: "Please write a brief paragraph explaining why you would be a good fit for this job.",
      user_id: current_user.id
    )
  end
  
end