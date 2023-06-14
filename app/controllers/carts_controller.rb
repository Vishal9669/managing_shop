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
    @cart_items = CartItem.create(cart_id:u.id,sub_product_id:@sub_product.id)
    if @cart_items
      redirect_to "/carts"
    else
      redirect_to sub_product_path(@sub_product)
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:id, cart_items_attributes: [:cart_id, :sub_product_id, :quantity, :total])
  end

end
