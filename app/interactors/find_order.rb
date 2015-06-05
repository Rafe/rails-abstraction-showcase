class FindOrder
  include Interactor

  def call
    context.order = Order.find(context.id)
  end
end
