class Product::Cell < Cell::Concept
  include ActionView::Helpers::FormHelper

  property :id
  property :name
  property :description
  property :price

  def show
    render
  end

  def order_item
    OrderItem.new
  end

  def dom_class(record, prefix = nil)
    ActionView::RecordIdentifier.dom_class(record, prefix)
  end

  def dom_id(record, prefix = nil)
    ActionView::RecordIdentifier.dom_id(record, prefix)
  end
end
