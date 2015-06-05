class FindOrderAction
  include LightService::Action

  expects :params
  promises :order

  executed do |context|
    context.order = Order.find(context.params[:id])
  end
end
