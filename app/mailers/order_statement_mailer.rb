class OrderStatementMailer < ApplicationMailer
  def send_order_statement(order, pdf)
    @order = order
    attachments['order_statement.pdf'] = pdf

    mail(to: order.user.email, subject: 'Your Order Details')
  end
end
