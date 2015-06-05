class CreateOrderItemAction
  include LightService::Action

  expects :order, :params
  promises :success

  executed do |context|
    context.order.order_items.build(context.params)
    context.success = context.order.save
    context
  end
end
