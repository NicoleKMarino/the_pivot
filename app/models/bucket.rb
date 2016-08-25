class Bucket
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_application(job_application)
    if @contents.keys.include?(job_application.job_id)
     return false
    else
      @contents[job_application.id.to_s] ||= ""
      return true
    end
  end

  def total_applications
    contents.length
  end

  def all_applications
    contents.map do |application_id, summary|
      application = JobApplication.find(application_id)
      BucketApplication.new(application, summary)
    end
  end

  def remove_application(job_application)
    @contents.delete(job_application.id.to_s)
  end
end