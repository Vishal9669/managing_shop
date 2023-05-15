class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: 'User created successfully.'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name,:company_name, :mfg_date, :exp_date, :quality, :price)
  end
end
