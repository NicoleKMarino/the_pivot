require 'rails_helper'

RSpec.describe 'Bucket Job', type: :model do
  it 'should initialize with a job id and summary' do
    job = create_job
    bucket_job = BucketJob.new(job.id, "I need this job!")

    expect(bucket_job.summary).to eq("I need this job!")
    expect(bucket_job.title).to eq(job.title)
  end
end
