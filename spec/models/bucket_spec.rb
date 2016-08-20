require 'rails_helper'

RSpec.describe 'bucket', type: :model do
  it 'should have an empty hash if no session[:bucket]' do
    bucket = Bucket.new(nil)

    expect(bucket.contents).to eq({})
  end

  it 'should be able to add job by job id' do
    bucket = Bucket.new(nil)

    bucket.add_job(1)
    bucket.add_job(2)
    bucket.add_job(2)

    expect(bucket.contents).to eq('1' => '', '2' => '')
  end

  it 'should be able to calculate total jobs' do
    bucket = Bucket.new('1' => {}, '4' => {})

    expect(bucket.total_jobs).to eq(2)
  end

  it 'should return 0 as total jobs for an empty bucket' do
    bucket = Bucket.new(nil)

    expect(bucket.total_jobs).to eq(0)
  end

  xit 'should return an array of BucketJobs for its contents' do
    jobs = create_list(:item, 2)
    cart = Cart.new(nil)
    cart.add_item(items.first.id)
    cart.add_item(items.last.id)

    expect(cart.all_items.first.quantity).to eq(cart.contents["#{items.first.id}"])
  end
end
