class BasketPrinter
  attr_reader :baskets

  def initialize(baskets)
    @baskets = baskets
  end

  def print
    puts format("%-30s %10s", "Products", "Total")
    puts "-" * 42

    baskets.each do |basket|
      puts format("%-30s %10s", basket.items.map(&:code).join(", "), "$#{basket.total}")
    end
  end
end
