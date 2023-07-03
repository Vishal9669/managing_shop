class OrdersController < ApplicationController

  def index
    @orders = current_user.orders.includes(:order_items, :cart).order("created_at DESC")
  end

  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        pdf = render_to_string pdf: "Invoice",
                               template: 'orders/show.html.erb',
                               encoding: "UTF-8"

        OrderStatementMailer.send_order_statement(@order, pdf).deliver_now
        send_data pdf, filename: 'order_statement.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end
end
