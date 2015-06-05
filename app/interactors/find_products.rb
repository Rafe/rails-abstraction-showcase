class FindProducts
  include Interactor

  def call
    context.products = Product.page(context.page)
                              .per(context.per)
  end
end
