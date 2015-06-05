class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :assign_user_to_order

  def create
    CreateOrderItem.run!(order: current_order, item_params: item_params)

    session[:order_id] = current_order.id

    redirect_to products_path
  end

  def destroy
    DestroyOrderItem.run!(order: current_order, id: params[:id])

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
