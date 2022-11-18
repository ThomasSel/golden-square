class Order
  def initialize
    @dishes = []
    @is_submitted = false
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
    fail "You cannot submit an empty order" if @dishes.empty?

    @is_submitted = true
  end

  def submitted?
    return @is_submitted
  end
end