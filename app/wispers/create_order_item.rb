class CreateOrderItem
  include Wisper::Publisher

  def call(order, params)
    order.order_items.build(item_params(params))
    if order.save
      publish(:create_order_item_successful, order)
    else
      publish(:create_order_item_failed)
    end
  end

  def item_params(params)
    params.require(:order_item).permit(:product_id)
  end
end
