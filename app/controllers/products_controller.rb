class ProductsController < ApplicationController


  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
    @subproduct = @product.sub_products.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to "/products"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url
  end

  def  selected_subproducts
    product = Product.find(params[:id])
    subproducts = product.sub_products
    render json: subproducts
  end

  private

  def product_params
    params.require(:product).permit(:id, :name)
  end

  def sub_product_params
    params.require(:sub_product).permit(:company_name, :description, :mfg_date, :price, :product_id)
  end

  def order_form
    @product = Product.find(params[:id])
    @user = current_user
    @order = Order.new
  end

end
