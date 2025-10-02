require_relative "product"
require_relative "delivery_rule"

product_catalogue = [
  Product.new(code: "R01", name: "Red Widget", price: 32.95),
  Product.new(code: "G01", name: "Green Widget", price: 24.95),
  Product.new(code: "B01", name: "Blue Widget", price: 7.95)
]

puts product_catalogue.inspect

delivery_rule = DeliveryRule.new(min: 0, max: 50, cost: 4.95)

puts delivery_rule.inspect
