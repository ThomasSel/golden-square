require 'order'

RSpec.describe Order do
  it "Initial state is empty" do
    order = Order.new
    expect(order.list).to eq []
    expect(order.total_price).to eq 0.0
    expect(order.submitted?).to eq false
  end

  it "Adding dishes to the order" do
    order = Order.new
    dish_1 = double(:fake_dish, available?: true)
    dish_2 = double(:fake_dish, available?: true)
    dish_3 = double(:fake_dish, available?: true)
    order.add(dish_1)
    order.add(dish_2)
    order.add(dish_3)
    expect(order.list).to eq [dish_1, dish_2, dish_3]
  end

  it "error adding unavailable dishes" do
    order = Order.new
    error_message = "This dish is unavailable"
    expect { order.add(double(:fake_dish, available?: false)) }.to raise_error error_message
  end

  it "total_price returns the total price of the order" do
    order = Order.new
    order.add(double(:fake_dish, available?: true, price: 5.0))
    order.add(double(:fake_dish, available?: true, price: 4.0))
    order.add(double(:fake_dish, available?: true, price: 5.99))
    expect(order.total_price).to eq 14.99
  end

  it "submit! fails when submitting an empty order" do
    order = Order.new
    expect { order.submit! }.to raise_error "You cannot submit an empty order"
  end

  it "submit! changes the submission status of the order" do
    order = Order.new
    order.add(double(:fake_dish, available?: true))
    expect(order.submitted?).to eq false
    order.submit!
    expect(order.submitted?).to eq true
  end
end