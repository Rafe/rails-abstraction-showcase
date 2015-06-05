class FindProducts < Mutations::Command
  optional do
    integer :page, default: 1
    integer :per, default: 9
  end

  def execute
    Product.page(page).per(per)
  end
end
