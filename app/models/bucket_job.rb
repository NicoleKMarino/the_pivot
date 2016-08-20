class BucketJob < SimpleDelegator
  attr_reader :summary

  def initialize(job_id, summary)
    @job = Job.find(job_id.to_i)
    @summary = summary
    super(@job)
  end
end
