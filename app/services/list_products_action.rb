class ListProductsAction
  include LightService::Action

  expects :page, :per
  promises :products

  executed do |context|
    context.products = Product.page(context.page).per(context.per)
  end
end
