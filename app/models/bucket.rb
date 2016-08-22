class Bucket
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_job(job_id)
    @contents[job_id.to_s] ||= ""
  end

  def total_jobs
    contents.length
  end

  def all_jobs
    contents.map do |job_id, summary|
      job = Job.find(job_id)
      BucketJob.new(job, summary)
    end
  end

  def remove_job(job)
    @contents.delete(job.id.to_s)
  end
end
