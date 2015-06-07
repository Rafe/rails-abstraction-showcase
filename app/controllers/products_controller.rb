class ProductsController < ApplicationController
  def index
    @products = FindProducts.new(params: params).run
  end
end
