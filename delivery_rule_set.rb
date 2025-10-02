require_relative "delivery_rule"

class DeliveryRuleSet
  def initialize(rules)
    @rules = rules
  end

  def find_delivery_charges(total_before_delivery)
    rule = @rules.find { |r| r.applies?(total_before_delivery) }
    rule ? rule.cost : 0.0
  end
end
