class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def checkout
  end

  def proceed
    proceed_order = ProceedOrder.new

    proceed_order.on(:proceed_order_successful) do
      session[:order_id] = nil
      flash[:notice] = t('order.proceed')
      redirect_to root_path
    end

    proceed_order.on(:proceed_order_failed) do
      render :checkout
    end

    proceed_order.call(params)
  end
end
