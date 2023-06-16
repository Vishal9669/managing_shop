class CartItemsController < ApplicationController
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end

  def update
    @cart_item = CartItem.find(params[:id])

    if @cart_item.update(cart_item_params)
      redirect_to carts_path
    else
      render json: { success: false }
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
