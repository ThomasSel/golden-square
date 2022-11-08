require "greet"

RSpec.describe "Greet method" do
  it 'Returns "Hello, Thomas!" for input "Thomas"' do
    result = greet("Thomas")
    expect(result).to eq "Hello, Thomas!"
  end
end