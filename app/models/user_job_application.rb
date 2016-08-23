class UserJobApplication < SimpleDelegator
  
  def initialize(job_application, user)
    @user = user.id
    @job_application = job_application
    @job_application.change_status_to_submitted
    @job_application.assign_user(user)
  end
end