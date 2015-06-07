class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def checkout
  end

  def proceed
    if ProceedOrder.new(params).run
      session[:order_id] = nil
      flash[:notice] = t('order.proceed')
      redirect_to root_path
    else
      render :checkout
    end
  end

end
