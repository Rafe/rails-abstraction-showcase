class OrdersController < ApplicationController
  before_action :authenticate_user!
  expose(:order, attributes: :order_params)

  def index
  end

  def checkout
  end

  def proceed
    order.state = Order::COMPLETED
    if order.save
      session[:order_id] = nil
      flash[:notice] = t('order.proceed')
      redirect_to root_path
    else
      render :checkout
    end
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
