class SubProductsController < ApplicationController
  before_action :set_product_id , only: [:create, :show, :edit, :update, :destroy]
  before_action :set_sub_product_id, only: [:show, :edit, :update, :destroy]

  def index
    @subproducts = SubProduct.all
  end

  def show
  end

  def new
    @subproduct = SubProduct.new
  end

  def create
    @subproduct = @product.sub_products.create(sub_product_params)
    redirect_to product_path(@product)
  end

  def edit
    @subproduct = @product.sub_products.find(params[:id])
  end

  def update
    if @subproduct.update(sub_product_params)
      redirect_to product_path(@product)
    else
      render :edit , status: :unprocessable_entity
    end
  end

  def destroy
    @subproduct.destroy
    redirect_to product_path(@product)
  end

  private

  def set_product_id
    @product = Product.find(params[:product_id])
  end

  def set_sub_product_id
    @subproduct = SubProduct.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:id, :name)
  end

  def sub_product_params
    params.require(:sub_product).permit(:company_name, :description, :mfg_date, :price, :product_id)
  end
end
