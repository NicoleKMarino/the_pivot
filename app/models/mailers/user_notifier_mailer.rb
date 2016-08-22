class UserNotifierMailer < ApplicationMailer
  default from: 'onefanstreasure@gmail.com'

  def send_signup_email(user)
    @user = user
    mail(
      to: @user.email,
      subject: "Welcome to One Fan's Treasure!"
      )
  end

  def send_confirmation_email(user, order)
    @user = user
    @order = order
    mail(
      to: @user.email,
      subject: "Thank you for your order - Order ##{@order.id}"
    )
  end
end
