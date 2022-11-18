class DishList
  def initialize
    @dishes = []
  end

  def add(dish) 
    @dishes.push(dish).uniq!
  end

  def list_available
    @dishes.select(&:available?)
  end

  def all
    @dishes
  end
end