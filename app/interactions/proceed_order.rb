require 'active_interaction'

class ProceedOrder < ActiveInteraction::Base
  integer :id
  hash :order_params, strip: false

  def execute
    order = Order.find(id)
    order.assign_attributes(order_params)
    order.state = Order::COMPLETED
    order.save
  end
end
