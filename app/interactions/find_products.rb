require 'active_interaction'

class FindProducts < ActiveInteraction::Base
  integer :page, default: 1
  integer :per, default: 9

  def execute
    Product.page(page).per(per)
  end
end
