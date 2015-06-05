class ProductsController < ApplicationController
  def index
    @products = FindProducts.call(page: params[:id], per: 9).products
  end
end
