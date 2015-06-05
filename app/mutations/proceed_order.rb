class ProceedOrder < Mutations::Command
  required do
    integer :id
    hash :order_params do
      string :address
      string :card_number
      string :card_code
      string :card_month
      string :card_year
    end
  end

  def execute
    order = Order.find(id)
    order.assign_attributes(order_params)
    order.state = Order::COMPLETED
    order.save
  end
end
