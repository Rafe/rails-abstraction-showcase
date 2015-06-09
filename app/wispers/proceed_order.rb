class ProceedOrder
  include Wisper::Publisher

  def call(params)
    order = Order.find(params[:id])
    order.assign_attributes(order_params(params))
    order.state = Order::COMPLETED
    if order.save
      publish(:proceed_order_successful)
    else
      publish(:proceed_order_failed)
    end
  end

  def order_params(params)
    params.require(:order).permit([
      :address,
      :card_number,
      :card_code,
      :card_month,
      :card_year
    ])
  end
end
