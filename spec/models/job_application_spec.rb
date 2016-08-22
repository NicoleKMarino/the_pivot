require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  it { should validate_presence_of :summary }
  
  it "status should default to started" do
    job_application = create_job_application
    expect(job_application.status).to eq("started")
  end

  it "can change the status to submitted" do
    job_application = create_job_application
    job_application.change_status_to_submitted
    expect(job_application.status).to eq("submitted")
  end
end
