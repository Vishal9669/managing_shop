class OrdersController < ApplicationController

  def index
    @orders = current_user.orders.includes(:order_items, :cart)
  end

  def generate_pdf
    @order = Order.includes(:order_items).find(params[:id])
    pdf = render_to_string pdf: "Invoice",
                           template: 'orders/show.html.erb',
                           encoding: "UTF-8"

    OrderStatementMailer.send_order_statement(@order, pdf).deliver_now

    respond_to do |format|
      format.html
      format.pdf do
        send_data pdf, filename: 'order_statement.pdf', type: 'application/pdf', disposition: 'attachment'
      end
    end
  end

  private
  def order_params
    params.require(:order).permit(:id)
  end
end
