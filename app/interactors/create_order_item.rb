class CreateOrderItem
  include Interactor

  def call
    order = context.order
    order.order_items.build(context.params)
    order.save
  end
end
