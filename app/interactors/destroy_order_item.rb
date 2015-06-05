class DestroyOrderItem
  include Interactor

  def call
    context.order.order_items.find(context.id).destroy
  end
end
