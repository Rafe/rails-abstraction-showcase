class OrderItem < ActiveRecord::Base
  class Create < Trailblazer::Operation
    include CRUD

    model OrderItem, :create

    contract do
      property :product_id

      validates :product_id, presence: true, allow_blank: false
    end

    def process(params)
      validate(params[:order_item]) do |f|
        f.save
      end
    end
  end

  class Destroy < Trailblazer::Operation
    include CRUD

    model OrderItem, :update

    contract do
      property :id
    end

    def process(params)
      validate(params) do |f|
        f.model.destroy
      end
    end
  end
end
