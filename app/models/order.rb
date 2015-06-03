class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items, counter_cache: true

  CURRENT = 'current'
  COMPLETED = 'completed'

  def self.current_order_for(user)
    order = Order.find_by(user_id: user.id, state: CURRENT)
    if order.present?
      order
    else
      Order.create(user: user, state: CURRENT)
    end
  end
end
