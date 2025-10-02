class OfferEngine
  attr_reader :offers

  def initialize(offers)
    @offers = offers
  end

  def apply(grouped_items, subtotal)
    discount = offers.sum { |offer| offer.apply_discount(grouped_items) }
    subtotal - discount
  end
end
