class OrderItemsController < ApplicationController
  expose(:order_item, attributes: :item_params)
  before_action :authenticate_user!
  before_action :assign_user_to_order

  def create
    order_item.order = current_order
    order_item.save

    session[:order_id] = current_order.id

    redirect_to products_path
  end

  def destroy
    order_item.destroy

    flash[:notice] = t('order_item.destroy')

    redirect_to orders_path(current_order)
  end

  private

  def item_params
    params.require(:order_item).permit(:product_id)
  end

  def assign_user_to_order
    if user_signed_in? && current_order.user.blank?
      current_order.user = current_user
    end
  end
end
