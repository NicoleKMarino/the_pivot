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

  def all_items #edit this method and write test
    contents.map do |job_id, summary|
      BucketJob.new(job_id, summary)
    end
  end

end
