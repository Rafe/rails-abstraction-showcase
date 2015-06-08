class OrderItem::Cell < Cell::Concept
  property :product

  def show
    render
  end

  def checkout?
    true
  end
end
