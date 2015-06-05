class CreateOrderItem < Mutations::Command
  required do
    model :order, new_records: true
    hash :params do
      integer :product_id
    end
  end

  def execute
    order.order_items.build(params)
    order.save
  end
end
