class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    order.order_items.create(item_param)

    redirect_to products_path
  end

  def destroy
    OrderItem.find(params[:id]).destroy

    flash[:order_item_destoried] = 'Successfully remove item from cart'

    redirect_to order_path(order)
  end

  def item_param
    params.require(:order_item).permit(:product_id)
  end

  def order
    @order ||= Order.current_order_for(current_user)
  end
end
