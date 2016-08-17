require 'rails_helper'

RSpec.describe 'Cart Item', type: :model do
  xit 'should initialize with an item id and quantity' do
    item = create(:item)
    cart_item = CartItem.new(item.id, 2)

    expect(cart_item.quantity).to eq(2)
    expect(cart_item.title).to eq(item.title)
  end

  xit 'should calculate the sub-total of an item' do
    item = create(:item)
    cart_item = CartItem.new(item.id, 2)

    expect(cart_item.sub_total).to eq(item.price * cart_item.quantity)
  end
end
