class BucketJob < SimpleDelegator
  attr_reader :summary

  def initialize(job, summary)
    @job = job
    @summary = summary
    super(@job)
  end
end
