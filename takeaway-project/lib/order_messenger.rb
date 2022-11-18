class OrderMessenger
  def initialize(order, number)
    @order = order
  end

  def send_message
    fail "Cannot send a message for a non submitted order" unless @order.submitted?
  end
end