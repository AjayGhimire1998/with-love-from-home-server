class StoreMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.store_mailer.password_reset.subject
  #
  def store_password_reset(store)
    @store = store
    mail to: store.email, subject: "Password Reset"
  end

  def store_order_received(store, items, cart)
    @store = store
    @items = items
    @cart = cart
    mail to: store.email, subject: "Orders Received"
  end
end
