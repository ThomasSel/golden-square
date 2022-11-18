require "order"
require "dish"
require "order_receipt"
require "order_messenger"

RSpec.describe "order integrgation" do
  it "check Order adds dishes to its list" do
    order = Order.new
    dish_1 = Dish.new("Pizza", 5.0)
    dish_2 = Dish.new("Pasta", 4.0)
    order.add(dish_1)
    order.add(dish_2)
    expect(order.list).to eq [dish_1, dish_2]
  end

  it "throws an error when adding an unavailable dish" do
    order = Order.new
    dish_1 = Dish.new("Pizza", 5.0)
    dish_1.set_availability!(false)
    expect { order.add(dish_1) }.to raise_error "This dish is unavailable"
  end

  it "total_price calculates the total price of the order" do
    order = Order.new
    order.add(Dish.new("Pizza", 5.0))
    order.add(Dish.new("Pasta", 4.0))
    order.add(Dish.new("Lasagne", 5.99))
    expect(order.total_price).to eq 14.99
  end

  it "OrderReceipt returns a formatted string of each dish, their price and the total price" do
    order = Order.new
    order.add(Dish.new("Pizza", 5.0))
    order.add(Dish.new("Pasta", 4.0))
    order.add(Dish.new("Lasagne", 5.99))
    order.add(Dish.new("Cheese platter", 12.50))
    order_receipt = OrderReceipt.new(order)
    expected_result = "PIZZA                £5.00\nPASTA                £4.00\nLASAGNE              £5.99\nCHEESE PLATTER      £12.50\n==========================\nTOTAL               £27.49"
    expect(order_receipt.print_receipt).to eq expected_result
  end

  xit "OrderMessenger sends a text when the order has been submitted" do
    order = Order.new
    order.add(Dish.new("Pizza", 5.0))
    order.add(Dish.new("Pasta", 4.0))
    order.submit!
    order_messenger = OrderMessenger.new(order, "07000000000")
    #expect(order_messenger.send_message) # => sends message to 07000000000
  end

  it "OrderMessenger raises error when trying to send a message for an order that hasn't been submitted yet" do
    order = Order.new
    order.add(Dish.new("Pizza", 5.0))
    order.add(Dish.new("Pasta", 4.0))
    order_messenger = OrderMessenger.new(order, "07000000000")
    expect { order_messenger.send_message }.to raise_error "Cannot send a message for a non submitted order"
  end
end