require 'rails_helper'

RSpec.describe Job, Job: :model do
  it { should belong_to :company }
  it { should validate_presence_of :title}
  it { should validate_presence_of :salary }
  it { should have_db_column(:status).with_options(default: 'available') }

  xit "should return tell if an item is sold out" do #need to update this for job that is unavailable
    item = create(:sold_out_item)
    expect(item.sold_out?).to eq(true)
  end
end
