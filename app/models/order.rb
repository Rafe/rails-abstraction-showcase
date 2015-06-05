class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items, counter_cache: true

  scope :current, -> { where(state: CURRENT) }

  CURRENT = 'current'
  COMPLETED = 'completed'

  validates :address, presence: true, allow_blank: false, if: :complete?
  validates :card_number, presence: true, allow_blank: false, if: :complete?
  validates :card_year, presence: true, allow_blank: false, if: :complete?
  validates :card_month, presence: true, allow_blank: false, if: :complete?

  def self.current_order_for(user)
    order = Order.find_by(user_id: user.id, state: CURRENT)
    if order.present?
      order
    else
      Order.create(user: user, state: CURRENT)
    end
  end

  def initialize(*args)
    super(*args)
    self.state = CURRENT unless self.state
  end

  def complete?
    self.state == COMPLETED
  end

  def total_price
    order_items.map(&:product).map(&:price).sum
  end
end
