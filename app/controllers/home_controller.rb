class HomeController < ApplicationController
  def index
     @products = Product.all
     @sub_product = SubProduct.all
  end
end
