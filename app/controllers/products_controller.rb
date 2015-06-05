class ProductsController < ApplicationController
  def index
    @products = FindProducts.run!(page: params[:page])
  end
end
