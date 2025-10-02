require_relative "product"
require_relative "delivery_rule"
require_relative "delivery_rule_set"
require_relative "offers/buy_x_get_nth_half"

product_catalogue = [
  Product.new(code: "R01", name: "Red Widget", price: 32.95),
  Product.new(code: "G01", name: "Green Widget", price: 24.95),
  Product.new(code: "B01", name: "Blue Widget", price: 7.95)
]

delivery_rules = DeliveryRuleSet.new([
   DeliveryRule.new(min: 0, max: 50, cost: 4.95),
   DeliveryRule.new(min: 50, max: 90, cost: 2.95),
   DeliveryRule.new(min: 90, max: Float::INFINITY, cost: 0.0)
 ])

offers = [BuyXGetNthHalf.new(product_code: "R01", nth: 2, discount: 0.5)]
