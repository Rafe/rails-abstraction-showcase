class ProductsController < ApplicationController
  PAGE = 9
  def index
    @products = Product.page(params[:page]).per(PAGE)
  end
end
