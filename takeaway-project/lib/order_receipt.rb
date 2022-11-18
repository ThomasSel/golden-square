class OrderReceipt
  def initialize(order)
    @order = order
  end

  def print_receipt
    result = ""
    @order.list.each do |dish|
      result += format_dish(dish.name, dish.price)
    end
    result += '=' * 26 + "\n"
    result += format_dish("Total", @order.total_price)
    return result.rstrip
  end

  private

  def format_dish(name, price)
    price_string = "£%.2f" % [price]
    return "%-19s%7s\n" % [name.upcase, price_string]
  end
end