require 'rails_helper'

RSpec.describe OrderItem, :type => :model do
  it { is_expected.to validate_presence_of :order }
  it { is_expected.to validate_presence_of :product }
  it { is_expected.to belong_to :order }
  it { is_expected.to belong_to :product }
end
