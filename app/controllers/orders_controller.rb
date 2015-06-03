class OrdersController < ApplicationController
  before_action :authenticate_user!

  def show
    @order = Order.current_order_for(current_user)
  end

  def checkout

  end
end
