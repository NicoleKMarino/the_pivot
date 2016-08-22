class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  enum status: %w(Ordered Paid Cancelled Completed)

  after_create :send_order_confirmation

  def date
    created_at.strftime("%m/%d/%Y")
  end

  def sub_total(item)
    item_quantity(item) * item.price
  end

  def total
    items.reduce(0) { |initial, item| initial += sub_total(item) }
  end

  def time_updated
    updated_at.strftime("%m-%e-%y %H:%M %p")
  end

  def item_quantity(item)
    OrderItem.find_by(order: self, item: item).quantity
  end

  def total_items
    items.reduce(0) { |initial, item| initial += item_quantity(item) }
  end

  def total_in_cents
    total.to_f * 100
  end

  def ordered?
    status == "Ordered"
  end

  private

  def send_order_confirmation
    if @current_user && @current_user.email
      UserNotifierMailer.send_confirmation_email(@current_user, self).deliver
    end
  end
end
