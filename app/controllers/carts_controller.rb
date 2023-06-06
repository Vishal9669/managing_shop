class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end


  def add_to_cart
    @subproduct = SubProduct.find(params[:sub_products])
    cart = @subproduct.carts.new
    if cart.save
      redirect_to "/carts"
    else
      render :new
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_url
  end

  private

  def cart_params
    params.require(:cart).permit(:id, :sub_product_id)
  end

end
