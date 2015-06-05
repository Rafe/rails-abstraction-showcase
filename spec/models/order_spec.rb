require 'rails_helper'

RSpec.describe Order, :type => :model do
  let(:user) { User.create(email: 'test@test.com', password: '12345678') }
  let(:order) { described_class.create(user: user) }

  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :order_items }

  context 'for completed order' do
    before do
      allow_any_instance_of(described_class).to receive(:complete?).and_return(true)
    end
    it { is_expected.to validate_presence_of :address }
    it { is_expected.to validate_presence_of :card_number }
    it { is_expected.to validate_presence_of :card_year }
    it { is_expected.to validate_presence_of :card_month }
  end

  describe '.current_order_for' do
    it 'finds and return current order' do
      order
      expect(described_class.current_order_for(user)).to eq order
    end

    it 'creates new order' do
      expect(order).to be_a(described_class)
      expect(order.user).to eq user
    end
  end

  describe '#compelte?' do
    it 'returns true is state is completed' do
      expect(order).to_not be_complete

      order.state = described_class::COMPLETED

      expect(order).to be_complete
    end
  end

  describe '#total_price' do
    it 'returns total order item price' do
      order.order_items.create(product: Product.create(name: 'product 1', price: 10))
      order.order_items.create(product: Product.create(name: 'product 2', price: 20))
      order.order_items.create(product: Product.create(name: 'product 3', price: 30))

      expect(order.total_price.to_i).to eq 60
    end
  end
end
