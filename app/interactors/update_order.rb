class UpdateOrder
  include Interactor

  def call
    order = context.order
    order.assign_attributes(context.params)
    order.state = Order::COMPLETED
    order.save
  end
end
