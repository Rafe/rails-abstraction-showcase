class DestroyOrderItemAction
  include LightService::Action

  expects :id, :order

  executed do |context|
    context.order.order_items.find(context.id).destroy
  end
end
