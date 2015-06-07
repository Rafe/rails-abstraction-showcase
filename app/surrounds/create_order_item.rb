class CreateOrderItem
  extend Surrounded::Context

  initialize_without_keywords :order, :params

  role :params do
    def item_params
      params.require(:order_item).permit(:product_id)
    end
  end

  role :order

  trigger :run do
    order.order_items.build(params.item_params)
    order.save
  end
end
