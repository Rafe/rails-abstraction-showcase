class UpdateOrderAction
  include LightService::Action
  expects :order, :params
  promises :success

  executed do |context|
    order = context.order
    order.assign_attributes(order_params(context))
    order.state = Order::COMPLETED
    context.success = order.save
  end

  def self.order_params(context)
    context.params.require(:order).permit([
      :address,
      :card_number,
      :card_code,
      :card_month,
      :card_year
    ])
  end
end
