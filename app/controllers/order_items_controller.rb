class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :assign_user_to_order

  def create
    create_order_item = CreateOrderItem.new

    create_order_item.on(:create_order_item_successful) do |order|
      session[:order_id] = order.id
      redirect_to products_path
    end

    create_order_item.on(:create_order_item_failed) do
      redirect_to products_path
    end

    create_order_item.call(current_order, params)
  end

  def destroy
    destroy_order_item = DestroyOrderItem.new

    destroy_order_item.on(:destroy_order_item) do |order|
      flash[:notice] = t('order_item.destroy')
      redirect_to orders_path(order)
    end

    destroy_order_item.call(current_order, params)
  end

  private

  def assign_user_to_order
    if user_signed_in? && current_order.user.blank?
      current_order.user = current_user
    end
  end
end
