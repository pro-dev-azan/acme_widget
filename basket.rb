require_relative "offer_engine"

class Basket
  attr_reader :product_catalogue, :delivery_rules, :offer_engine, :items

  def initialize(product_catalogue:, delivery_rules:, offers:)
    @product_catalogue = product_catalogue
    @delivery_rules = delivery_rules
    @offer_engine = OfferEngine.new(offers)
    @items = []
  end

  def add(product_code)
    product = product_catalogue.find { |p| p.code == product_code }
    raise "Product code #{product_code} not found" unless product

    @items << product
  end

  def total
    discounted_total = offer_engine.apply(@items.group_by(&:code), @items.sum(&:price))
    delivery_cost = delivery_rules.find_delivery_charges(discounted_total)
    (discounted_total + delivery_cost).round(2, half: :down) # used half down to avoid round off e.g. 98.275 to 98.27
  end
end
