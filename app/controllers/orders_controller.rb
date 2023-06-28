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
        send_data pdf, filename: 'order_statement.pdf', type: 'application/pdf', disposition: 'attachment'
      end
    end
  end

  def search
    @search_query = params[:search_query]
    @filter = params[:filter]

    if @search_query.present?
      @search_results = current_user.orders.joins(order_items: :sub_product).where("sub_products.company_name ILIKE :search_query OR sub_products.description ILIKE :search_query", search_query: "%#{@search_query}%")
    else
      case @filter
      when "last_30_days"
        @search_results = current_user.orders.where(created_at: 30.days.ago..Time.now)
      when "last_3_months"
        @search_results = current_user.orders.where(created_at: 3.months.ago..Time.now)
      when "2022"
        @search_results = current_user.orders.where("extract(year from created_at) = ?", 2022)
      else
        @search_results = []
      end
    end
  end

  private
  def order_params
    params.require(:order).permit(:id, :product_id)
  end
end
