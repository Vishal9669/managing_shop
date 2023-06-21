class CartsController < ApplicationController

  before_action :authenticate_user!

  def index
    @cart = current_user.cart
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def add_to_cart

    if current_user.present? && current_user.cart.present?
      @cart = current_user.cart
    else
      @cart = current_user.build_cart
      @cart.save
    end

    @sub_product = SubProduct.find(params[:sub_product])
    u = @cart
    @cart_items = CartItem.create(cart_id:u.id, sub_product_id:@sub_product.id, quantity:1)
    if @cart_items
      redirect_to root_path
    else
      redirect_to sub_product_path(@sub_product)
    end
  end


  def create_order
    @cart = current_user.cart

    if @cart.cart_items.blank?
      redirect_to cart_path, alert: "Cart is empty. Please add items before placing an order."
    else
        order = Order.new(user: current_user, total: @cart.calculate_grand_total)
        order.save(validate: false)
        if order.persisted?
          order = Order.create(user: current_user, total: @cart.calculate_grand_total)
          @cart.destroy
          redirect_to orders_path, notice: "Order placed successfully!"
        else
          redirect_to carts_path, alert: "Failed to create the order."
        end
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:id, :grand_total, cart_items_attributes: [:cart_id, :sub_product_id, :quantity, :total])
  end
end
