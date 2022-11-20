class OrderMessenger
  def initialize(order, client,
                 recipient_number=ENV["MY_PHONE_NUMBER"],
                 sender_number=ENV["TWILIO_PHONE_NUMBER"])
    @order = order
    @client = client
    @recipient_number = recipient_number
    @sender_number = sender_number
  end

  def send_message
    fail "Cannot send a message for a non submitted order" unless @order.submitted?

    message = @client.messages.create(
      to: @recipient_number,
      from: @sender_number,
      body: "Your order has been received! It will be delivered 30 minutes from now"
    )

    fail message.error_message unless message.error_code.nil?
    return message.body[38, 100] if message.body.match?("Sent from your Twilio trial account - ")
    return message.body
  end
end