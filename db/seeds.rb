# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

products = [
  {
    name: 'Product 1',
    description: 'Description 1',
    price: 99,
  },
  {
    name: 'Product 2',
    description: 'Description 2',
    price: 99,
  },
  {
    name: 'Product 3',
    description: 'Description 3',
    price: 99,
  },
  {
    name: 'Product 4',
    description: 'Description 4',
    price: 99,
  },
  {
    name: 'Product 5',
    description: 'Description 5',
    price: 99,
  },
  {
    name: 'Product 6',
    description: 'Description 6',
    price: 99,
  },
  {
    name: 'Product 7',
    description: 'Description 7',
    price: 99,
  },
  {
    name: 'Product 8',
    description: 'Description 8',
    price: 99,
  },
  {
    name: 'Product 9',
    description: 'Description 9',
    price: 99,
  },
  {
    name: 'Product 10',
    description: 'Description 10',
    price: 99,
  },
  {
    name: 'Product 1',
    description: 'Description 1',
    price: 99,
  }
].each do |attributes|
  Product.create(attributes)
end

