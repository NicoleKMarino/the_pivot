require 'rails_helper'

RSpec.describe Job, Job: :model do
  it { should belong_to :company }
  it { should validate_presence_of :title}
  it { should validate_presence_of :salary }
  it { should have_db_column(:status).with_options(default: 'available') }

  it "can change the status of a job" do 
    job = create_job
    job.make_unavailable
    
    expect(job.unavailable?).to eq(true)
    expect(job.available?).to eq(false)
    
    job.make_available
    expect(job.available?).to eq(true)
    expect(job.unavailable?).to eq(false)
  end
end
