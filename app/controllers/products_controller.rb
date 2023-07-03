class ProductsController < ApplicationController
  before_action :set_product_id, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @subproduct = @product.sub_products.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
  def set_product_id
    @product = Product.find(params[:id])
  end


  def product_params
    params.require(:product).permit(:id, :name)
  end

  def sub_product_params
    params.require(:sub_product).permit(:company_name, :description, :mfg_date, :price, :product_id)
  end
end
