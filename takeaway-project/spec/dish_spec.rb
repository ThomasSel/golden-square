require 'dish'

RSpec.describe Dish do
  it "name and price getters" do
    dish = Dish.new("Pizza", 5)
    expect(dish.name).to eq "Pizza"
    expect(dish.price).to be 5.0
  end
  
  it "name cannot be empty" do
    expect { Dish.new("", 5.0) }.to raise_error "Dish must have a name"
    expect { Dish.new(nil, 5.0) }.to raise_error "Dish must have a name"
  end
  

  it "price cannot be negative" do
    expect { Dish.new("Pizza", -5.0) }.to raise_error "Dish must have a positive price"
  end

  it "the dish is initially available" do
    dish = Dish.new("Pizza", 5.0)
    dish.available? # => true
  end

  it "set_availability! changes the availability of the dish" do
    dish = Dish.new("Pizza", 5.0)
    dish.set_availability!(false)
    expect(dish.available?).to eq false
    dish.set_availability!(true)
    expect(dish.available?).to eq true
  end
end