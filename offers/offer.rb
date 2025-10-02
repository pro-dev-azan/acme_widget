class Offer
  attr_reader :product_code

  def initialize(product_code:)
    @product_code = product_code
  end

  def apply_discount(items)
    raise NotImplementedError, "Subclasses must implement #discount"
  end
end
