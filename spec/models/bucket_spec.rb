require 'rails_helper'

RSpec.describe 'bucket', type: :model do
  it 'should have an empty hash if no session[:bucket]' do
    bucket = Bucket.new(nil)

    expect(bucket.contents).to eq({})
  end

    it 'should be able to add application to the bucket' do
      bucket = Bucket.new(nil)
      job = create_job
      application = job.job_applications.create!(
        summary: "I'm the perfect candidate for this job.",
        education: "Turing",
        experience: "The pivot project",
        status: 0
      )    
      bucket.add_application(application)
    
      expect(bucket.contents).to eq("#{application.id}" => "")
    end

  it 'should be able to calculate total applications' do
    bucket = Bucket.new('1' => {}, '4' => {})

    expect(bucket.total_applications).to eq(2)
  end

  it 'should return 0 as total jobs for an empty bucket' do
    bucket = Bucket.new(nil)

    expect(bucket.total_applications).to eq(0)
  end
end
