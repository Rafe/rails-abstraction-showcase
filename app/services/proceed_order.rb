class ProceedOrder
  include LightService::Organizer

  def self.proceed(params)
    with(params: params).reduce(
      FindOrderAction,
      UpdateOrderAction
    )
  end
end
