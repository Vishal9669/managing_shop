class SubProductsController < ApplicationController
  before_action :set_product, only: [:create, :show, :edit, :update, :destroy]
  before_action :set_sub_product, only: [:edit, :update, :destroy]

  def index
    @subproducts = SubProduct.all
  end

  def new
    @subproduct = SubProduct.new
  end

  def create
    @subproduct = @product.sub_products.new(sub_product_params)

    if @subproduct.save
      flash[:success] = "#{@subproduct.company_name} successfully created!"
    else
      flash[:success] = "#{@subproduct.company_name} is already created!"
    end
    redirect_to product_path(@product)
  end

  def edit
    @subproduct = @product.sub_products.find(params[:id])
  end

  def update
    if @subproduct.update(sub_product_params)
      flash[:success] = "#{@subproduct.company_name} successfully updated!"
      redirect_to product_path(@product)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @subproduct.destroy
    flash[:success] = "#{@subproduct.company_name} successfully deleted!"
    redirect_to product_path(@product)
  end

  private
  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_sub_product
    @subproduct = SubProduct.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:id, :name)
  end

  def sub_product_params
    params.require(:sub_product).permit(:company_name, :description, :price, :product_id)
  end
end
