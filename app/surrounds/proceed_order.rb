class ProceedOrder
  extend Surrounded::Context

  initialize_without_keywords :params

  role :params do
    def order
      Order.find(params[:id])
    end

    def update
      order.assign_attributes(order_params)
      order.state = ::Order::COMPLETED
      order.save
    end

    def order_params
      params.require(:order).permit([
        :address,
        :card_number,
        :card_code,
        :card_month,
        :card_year
      ])
    end
  end

  trigger :run do
    params.update
  end
end
