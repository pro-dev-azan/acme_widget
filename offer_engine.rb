class OfferEngine
  def initialize(offers)
    @offers = offers
  end

  def apply(grouped_items, subtotal)
    discount = @offers.sum { |offer| offer.discount(grouped_items) }
    subtotal - discount
  end
end
