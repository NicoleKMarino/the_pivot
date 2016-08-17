require 'rails_helper'

RSpec.describe Order, type: :model do
  xit { should belong_to :user }
  xit { should have_many(:items).through(:order_items) }
  xit { should have_many :order_items }

  xit "should default to ordered status" do
    order = create(:order)
    expect(order.status).to eq("Ordered")
  end
end
