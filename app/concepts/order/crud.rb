class Order < ActiveRecord::Base
  class Proceed < Trailblazer::Operation
    include CRUD

    model Order, :update

    contract do
      property :address
      property :card_number
      property :card_code
      property :card_month
      property :card_year
      property :state

      validates :address, presence: true, allow_blank: false
      validates :card_number, presence: true, allow_blank: false
      validates :card_code, presence: true, allow_blank: false
      validates :card_year, presence: true, allow_blank: false
      validates :card_month, presence: true, allow_blank: false
    end

    def process(params)
      validate(params[:order]) do |f|
        f.state = Order::COMPLETED
        f.save
      end
    end
  end
end
