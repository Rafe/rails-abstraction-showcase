class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :assign_user_to_order

  def create
    run OrderItem::Create do |op|
      current_order.order_items << op.model
      current_order.save
      session[:order_id] = current_order.id
    end

    redirect_to products_path
  end

  def destroy
    run OrderItem::Destroy do |op|
      flash[:notice] = t('order_item.destroy')
    end

    redirect_to orders_path(current_order)
  end

  private

  def assign_user_to_order
    if user_signed_in? && current_order.user.blank?
      current_order.user = current_user
    end
  end
end
