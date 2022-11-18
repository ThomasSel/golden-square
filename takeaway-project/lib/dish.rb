class Dish
  def initialize(name, price) # name is a string and price is a float
    fail "Dish must have a name" if name == "" || name.nil?
    fail "Dish must have a positive price" if price < 0
    
    @name = name
    @price = price.to_f
    @is_available = true
  end

  def name
    return @name
  end

  def price
    return @price
  end

  def available?
    return @is_available
  end

  def set_availability!(bool)
    @is_available = bool
  end
end