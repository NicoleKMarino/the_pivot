require 'rails_helper'

RSpec.describe SavedJob, type: :model do
  it { should belong_to(:job) }
  it { should belong_to(:user) }

  it "should have a relationship with user and jobs" do
    job1 = create_job

    user1 = User.create(
      username: "Test",
      email: "lanerdoce@aol.com",
      password: "password",
      first_name: "Lane",
      last_name: "Winham",
      address: "2122 Concord Lane",
      city: "Denver", state: "CO",
      zip_code: 80215
    )

    SavedJob.create(user_id: user1.id, job_id: job1.id)

    expect(user1.jobs.first.title).to eq("Software Integration Developer")
  end
end
