class DestroyOrderItem < Mutations::Command
  required do
    model :order, new_records: true
    integer :id
  end

  def execute
    order.order_items.find(id).destroy
  end
end
