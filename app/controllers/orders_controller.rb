class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order = current_order
  end

  def checkout
    @order = current_order
  end

  def proceed
    @order = Order.find(params[:id])

    @order.update_attributes(order_params)
    @order.complete!

    session[:order_id] = nil
    flash[:notice] = 'Order has already been processed, you will received confirmation email shortly'

    redirect_to root_path
  end

  def order_params
    params.require(:order).permit([
      :address,
      :card_number,
      :card_code,
      :card_month,
      :card_year
    ])
  end
end
