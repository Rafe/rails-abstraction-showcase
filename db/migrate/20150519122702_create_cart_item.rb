class CreateCartItem < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.references :product
      t.timestamp
    end
  end
end
