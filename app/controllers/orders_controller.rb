class OrdersController < ApplicationController

  def index
    @cart = current_user.cart
  end


  def show
    @order = Order.find(params[:id])
  end

  def create
    @cart = Cart.find(params[:id])
    @order = Order.create(user: @cart.user, total: @cart.calculate_grand_total, cart: @cart)

    @cart.destroy
    redirect_to orders_path
  end

  def generate_pdf
    @cart = current_user.cart
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: orders_path,
               template: 'orders/index.html.erb',
               layout: 'pdf.html'
      end
    end
  end


  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_url
  end


  private
  def order_params
    params.require(:order).permit(:id, :user_id, :total, cart_attributes: [:id, :user_id, :total])
  end

end
