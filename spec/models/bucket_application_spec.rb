require 'rails_helper'

RSpec.describe 'Bucket Application', type: :model do
  it 'should initialize with a job id and summary' do
    job = create_job
    bucket_application = BucketApplication.new(job, "I need this job!")

    expect(bucket_application.summary).to eq("I need this job!")
    expect(bucket_application.title).to eq(job.title)
  end
end
