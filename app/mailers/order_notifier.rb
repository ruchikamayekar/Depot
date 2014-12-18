class OrderNotifier < ActionMailer::Base
###            Step 1: Configure the mail              ###

  # default from: "from@example.com"
  default from: "rhmayekar@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order
    mail(to: "ruchika.mayekar@kiprosh.com", subject: 'Pragmatic Store Order Confirmation')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order
    mail to: order.email, subject: 'Pragmatic Store Order Shipped'
  end
end