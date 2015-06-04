class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :assign_user_to_order

  def create
    current_order.order_items.build(item_param)
    current_order.save

    session[:order_id] = current_order.id

    redirect_to products_path
  end

  def destroy
    current_order.order_items.find(params[:id]).destroy

    flash[:order_item_destoried] = 'Successfully remove item from cart'

    redirect_to order_path(order)
  end

  def item_param
    params.require(:order_item).permit(:product_id)
  end

  private

  def assign_user_to_order
    if user_signed_in? && current_order.user.blank?
      current_order.user = current_user
    end
  end
end
