class CartItemsController < ApplicationController
  before_action :set_cart_item

  def destroy
    @cart_item.destroy
    redirect_to carts_path
  end

  def update
    if @cart_item.update(cart_item_params)
      redirect_to carts_path
    else
      render json: { success: false }
    end
  end

  private
  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :grand_total)
  end
end
