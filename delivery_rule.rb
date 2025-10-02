class DeliveryRule
  attr_reader :min, :max, :cost

  def initialize(min:, max:, cost:)
    @min  = min
    @max  = max
    @cost = cost
  end

  def applies?(sub_total)
    sub_total >= min && sub_total < max
  end
end
