require 'rails_helper'

RSpec.describe 'Cart', type: :model do
  xit 'should have an empty hash if no session[:cart]' do
    cart = Cart.new(nil)

    expect(cart.contents).to eq({})
  end

  xit 'should be able to add item by item id' do
    cart = Cart.new(nil)

    cart.add_item(1)
    cart.add_item(2)
    cart.add_item(2)

    expect(cart.contents).to eq('1' => 1, '2' => 2)
  end

  xit 'should be able to calculate total cost' do
    create_list(:item, 2)
    item_1 = Item.first
    item_2 = Item.last
    cart = Cart.new(nil)

    cart.add_item(item_1.id)
    cart.add_item(item_2.id)
    cart.add_item(item_2.id)

    expect(cart.total_cost).to eq(item_1.price + (item_2.price * 2))
  end

  xit 'should be able to calculate total items' do
    cart = Cart.new('1' => 3, '4' => 7)

    expect(cart.total_items).to eq(10)
  end

  xit 'should return 0.00 as total cost for an empty cart' do
    cart = Cart.new(nil)

    expect(cart.total_items).to eq(0.00)
  end

  xit 'should return 0 as total items for an empty cart' do
    cart = Cart.new(nil)

    expect(cart.total_items).to eq(0)
  end

  xit 'should return an array of CartItems for its contents' do
    items = create_list(:item, 2)
    cart = Cart.new(nil)
    cart.add_item(items.first.id)
    cart.add_item(items.last.id)

    expect(cart.all_items.first.quantity).to eq(cart.contents["#{items.first.id}"])
  end
end
