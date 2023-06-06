class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end

  def new
    @cart = Cart.new
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      redirect_to "/carts"
    else
      render :new
    end
  end

  def add_to_cart
    @subproduct = @product.sub_products.find(params[:id])
    redirect_to "/carts"
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
