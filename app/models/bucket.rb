class Bucket
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_application(job_application)
    #add conditional for not allowing duplicates
    @contents[job_application.id.to_s] ||= ""
  end

  def total_applications
    self.contents.length
  end

  def all_applications
    contents.map do |application_id, summary|
      application = JobApplication.find(application_id)
      # job = Job.find(application.job_id)
      BucketApplication.new(application, summary)
    end
  end

  def remove_application(job_application)
    @contents.delete(job_application.id.to_s)
  end
end