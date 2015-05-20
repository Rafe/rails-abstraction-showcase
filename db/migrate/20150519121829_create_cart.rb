class CreateCart < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :user
      t.timestamp
    end
  end
end
