class DeliveryRule
  attr_reader :min, :max, :cost

  def initialize(min:, max:, cost:)
    @min  = min
    @max  = max
    @cost = cost
  end
end
