class DestroyOrderItem
  extend Surrounded::Context

  initialize_without_keywords :order, :params

  role :order
  role :params do
    def item_id
      params[:id]
    end
  end


  trigger :run do
    order.order_items.find(params.item_id).destroy
  end
end
