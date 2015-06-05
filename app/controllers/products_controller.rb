class ProductsController < ApplicationController
  expose(:products) do
    Product.page(params[:page]).per(9)
  end

  def index
    @products = products
  end
end
