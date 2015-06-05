require 'active_interaction'

class CreateOrderItem < ActiveInteraction::Base
  object :order
  hash :item_params, strip: false

  def execute
    order.order_items.build(item_params)
    order.save
  end
end
