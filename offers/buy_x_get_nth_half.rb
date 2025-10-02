require_relative "offer"

class BuyXGetNthHalf < Offer
  attr_reader :nth, :discount

  def initialize(product_code:, nth:, discount:)
    super(product_code: product_code)
    @nth = nth # nth is the number of item to get the discount on and should be > 1
    @discount = discount
  end

  def apply_discount(grouped_items)
    items = grouped_items[product_code] || []
    return 0 unless items.size >= nth

    items[nth - 1].price * @discount
  end
end
