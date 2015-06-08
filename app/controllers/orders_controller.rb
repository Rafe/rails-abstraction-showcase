class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def checkout
  end

  def proceed
    run Order::Proceed do |op|
      session[:order_id] = nil
      flash[:notice] = t('order.proceed')
      return redirect_to root_path
    end

    render :checkout
  end
end
