class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order = current_order
  end

  def checkout
    @order = current_order
  end

  def proceed
    # check credit card data, check order, send email later

    session[:order_id] = nil
    @order.complete!
  end
end
