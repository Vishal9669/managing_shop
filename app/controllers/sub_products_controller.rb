class SubProductsController < ApplicationController
  # before_action :set_product
  before_action :set_sub_product, only: [:show, :edit, :update, :destroy]

  def index
    @subproducts = SubProduct.all
  end

  def show
    @subproduct = SubProduct.find(params[:id])
  end

  def new
    @subproduct = SubProduct.new
  end

  def create
    @subproduct = SubProduct.new(sub_product_params)

    if @subproduct.save
      redirect_to "/sub_products"
    else
      render :new
    end
  end


  def edit
    @subproduct = SubProduct.find(params[:id])
  end

  def update
    @subproduct = SubProduct.find(params[:id])
    if @subproduct.update(sub_product_params)
      redirect_to @subproduct
    else
      render :edit , status: :unprocessable_entity
    end
  end


  def destroy
    @subproduct = SubProduct.find(params[:id])
    @subproduct.destroy
    redirect_to sub_products_url
  end



  private


  # def set_product
  #   @subproduct = SubProduct.find(params[:product_id])
  # end

  def set_sub_product
    @subproduct = SubProduct.find(params[:id])
  end

  def sub_product_params
    params.require(:sub_product).permit(:company_name, :description, :mfg_date, :price, :product_id)
  end
end
