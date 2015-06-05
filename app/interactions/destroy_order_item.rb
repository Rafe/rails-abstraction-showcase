require 'active_interaction'

class DestroyOrderItem < ActiveInteraction::Base
  integer :id
  object :order

  def execute
    order.order_items
      .find(id)
      .destroy
  end
end
