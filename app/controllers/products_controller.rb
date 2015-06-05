class ProductsController < ApplicationController
  def index
    @products = ListProductsAction.execute(page: params[:page], per: 9).products
  end
end
