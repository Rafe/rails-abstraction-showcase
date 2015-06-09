class DestroyOrderItem
  include Wisper::Publisher

  def call(order, params)
    order.order_items.find(params[:id]).destroy
    publish(:destroy_order_item, order)
  end

  def item_params(params)
    params.require(:order_item).permit(:product_id)
  end
end
