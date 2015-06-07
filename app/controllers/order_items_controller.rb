class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :assign_user_to_order

  def create
    CreateOrderItem.new(current_order, params).run

    session[:order_id] = current_order.id

    redirect_to products_path
  end

  def destroy
    DestroyOrderItem.new(current_order, params).run

    flash[:notice] = t('order_item.destroy')

    redirect_to orders_path(current_order)
  end

  private

  def assign_user_to_order
    if user_signed_in? && current_order.user.blank?
      current_order.user = current_user
    end
  end
end
