class Product < ActiveRecord::Base
  validates :name, presence: true, allow_blank: false
  validates :price, presence: true, allow_blank: false
end
