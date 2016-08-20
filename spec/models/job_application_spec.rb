require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  it { should validate_presence_of :summary }
  
  it "should default to started" do
    job_application = create_job_application
    expect(job_application.status).to eq("started")
  end
end