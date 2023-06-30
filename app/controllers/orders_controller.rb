class OrdersController < ApplicationController

  def index
    @orders = current_user.orders.includes(:order_items, :cart)
  end

  def show
    @order = Order.find(params[:id])
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
        send_data pdf, filename: 'order_statement.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  def search
    @search_query = params[:search_query]
    @filter = params[:filter]

    if @search_query.present?
      @search_results = current_user.orders.joins(order_items: :sub_product).where("sub_products.company_name ILIKE :search_query OR sub_products.description ILIKE :search_query", search_query: "%#{@search_query}%")
      else
        @search_results = []
    end
  end

  private
  def order_params
    params.require(:order).permit(:id, :product_id)
  end
end
