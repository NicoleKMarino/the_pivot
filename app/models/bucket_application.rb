class BucketApplication < SimpleDelegator
  attr_reader :summary

  def initialize(application, summary)
    @application = application
    @summary = summary
    super(@application)
  end
end
