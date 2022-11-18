class Order
  def initialize
    @dishes = []
  end

  def add(dish)
    fail "This dish is unavailable" unless dish.available?

    @dishes << dish
  end

  def list
    return @dishes
  end

  def total_price
    return @dishes.sum(&:price)
  end

  def submit!
    # returns nothing
  end

  def submitted?
    # returns true if the order has been submitted
    # returns false otherwise
  end
end