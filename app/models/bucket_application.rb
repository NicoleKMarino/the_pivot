class BucketApplication < SimpleDelegator
  attr_reader :summary

  def initialize(job_application, summary)
    @job_application = job_application
    @summary = summary
    super(@job_application)
  end
end