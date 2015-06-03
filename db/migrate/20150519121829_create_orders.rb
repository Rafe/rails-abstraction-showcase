class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user
      t.integer :total_price, comment: 'total price of order'
      t.string :state, comment: 'order state'
      t.timestamps
    end

    add_index :orders, [:user_id, :created_at]
    add_index :orders, [:state, :created_at]
  end
end
