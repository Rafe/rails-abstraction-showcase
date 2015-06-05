class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def checkout
  end

  def proceed
    outcome = ProceedOrder.run!(id: params[:id], order_params: order_params)
    if outcome
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
