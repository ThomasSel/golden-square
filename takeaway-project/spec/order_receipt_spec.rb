require 'order_receipt'

RSpec.describe OrderReceipt do
  it "OrderReceipt returns a formatted string of each dish, their price and the total price" do
    dish_1 = double(:fake_dish,
                    name: "Pizza", price: 5.0)
    dish_2 = double(:fake_dish,
                    name: "Pasta", price: 4.0)
    dish_3 = double(:fake_dish,
                    name: "Lasagne", price: 5.99)
    dish_4 = double(:fake_dish,
                    name: "Cheese platter", price: 12.5)
    order = double(:fake_order, list: [dish_1, dish_2, dish_3, dish_4],
                   total_price: 27.49)
    order_receipt = OrderReceipt.new(order)
    expected_result = "PIZZA                £5.00\nPASTA                £4.00\nLASAGNE              £5.99\nCHEESE PLATTER      £12.50\n==========================\nTOTAL               £27.49"
    expect(order_receipt.print_receipt).to eq expected_result
  end
end