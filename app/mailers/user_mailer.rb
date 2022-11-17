class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def user_password_reset(user)
    @user = user
    mail to: user.email, subject: "Password Reset"
  end

  def user_order_placed(store, items, cart) 
    @store = store
    @items = items 
    @cart = cart
    mail to: cart.recipient_email, subject: "Orders Placed"
  end

  def user_order_status(store, item, cart)
    @store = store
    @item = item
    @cart = cart
    mail to: cart.recipient_email, subject: "Order Status Updated"
  end
end
