require 'rails_helper'

RSpec.describe Job, Job: :model do
  it { should belong_to :company }
  xit { should validate_uniqueness_of(:title).scoped_to(:celebrity_id) }
  it { should validate_presence_of :title}
  it { should validate_presence_of :salary }
  it { should have_db_column(:status).with_options(default: 'available') }

  xit "should give celebrity name" do
    item = create(:item)
    expect(item.celebrity.name).to eq(item.celebrity_name)
  end

  xit "should return tell if an item is sold out" do
    item = create(:sold_out_item)
    expect(item.sold_out?).to eq(true)
  end
end
