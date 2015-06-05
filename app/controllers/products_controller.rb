class ProductsController < ApplicationController
  def index
    @products = FindProducts.run(page: params[:page], per: params[:per]).result
  end
end
