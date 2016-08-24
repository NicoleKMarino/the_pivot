class BucketApplication < SimpleDelegator
  attr_reader :summary

  def initialize(application, summary)
    @application = application
    # @job = job
    @summary = summary
    super(@application)
  end
end
