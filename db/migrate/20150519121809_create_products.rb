class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price

      t.timestamp
    end

    add_index :products, :name
    add_index :products, :created_at
  end
end
