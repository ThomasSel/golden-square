require 'order_messenger'

RSpec.describe OrderMessenger do
  it "OrderMessenger sends a text when the order has been submitted" do
    order = double(:fake_order, submitted?: true)
    message_dbl = double(:fake_twilio_message)
    expect(message_dbl).to receive(:error_code).and_return(nil)
    expect(message_dbl).to receive(:body)
      .and_return("Your order has been received! It will be delivered 30 minutes from now")
      .twice
    messages_dbl = double(:fake_twilio_messages)
    expect(messages_dbl).to receive(:create)
      .with(
        to: ENV["MY_PHONE_NUMBER"],
        from: ENV["TWILIO_PHONE_NUMBER"],
        body: "Your order has been received! It will be delivered 30 minutes from now")
      .and_return(message_dbl)
    client_dbl = double(:fake_twilio_client)
    expect(client_dbl).to receive(:messages).and_return(messages_dbl)
    order_messenger = OrderMessenger.new(order, client_dbl, ENV["MY_PHONE_NUMBER"])
    order_messenger.send_message # => returns true
  end

  it "OrderMessenger fails if the message raises an error" do
    order = double(:fake_order, submitted?: true)
    message_dbl = double(:fake_twilio_message)
    expect(message_dbl).to receive(:error_code).and_return(404)
    error_message = "Failed to send text"
    expect(message_dbl).to receive(:error_message).and_return(error_message)
    messages_dbl = double(:fake_twilio_messages)
    expect(messages_dbl).to receive(:create)
      .with(
        to: ENV["MY_PHONE_NUMBER"],
        from: ENV["TWILIO_PHONE_NUMBER"],
        body: "Your order has been received! It will be delivered 30 minutes from now")
      .and_return(message_dbl)
    client_dbl = double(:fake_twilio_client)
    expect(client_dbl).to receive(:messages).and_return(messages_dbl)
    order_messenger = OrderMessenger.new(order, client_dbl, ENV["MY_PHONE_NUMBER"])
    expect { order_messenger.send_message }.to raise_error error_message
  end

  it "OrderMessenger raises error when trying to send a message for an order that hasn't been submitted yet" do
    order = double(:fake_order, submitted?: false)
    order_messenger = OrderMessenger.new(order, ENV["MY_PHONE_NUMBER"])
    error_message = "Cannot send a message for a non submitted order"
    expect { order_messenger.send_message }.to raise_error error_message
  end
end