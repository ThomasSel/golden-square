require "iterative_calculator"

RSpec.describe IterativeCalculator do
  it "calculator runs with correct io and result" do
    io = double(:io)
    expect(io).to receive(:puts).with("Hello. I will subtract two numbers.")
    expect(io).to receive(:puts).with("Please enter a number")
    expect(io).to receive(:gets).and_return("4")
    expect(io).to receive(:puts).with("Please enter another number")
    expect(io).to receive(:gets).and_return("3")
    expect(io).to receive(:puts).with("Here is your result:")
    expect(io).to receive(:puts).with("4 - 3 = 1")

    iterative_calculator = IterativeCalculator.new(io)
    iterative_calculator.run
  end

  it "calculator runs with correct io for a negative result" do
    io = double(:io)
    expect(io).to receive(:puts).with("Hello. I will subtract two numbers.")
    expect(io).to receive(:puts).with("Please enter a number")
    expect(io).to receive(:gets).and_return("3")
    expect(io).to receive(:puts).with("Please enter another number")
    expect(io).to receive(:gets).and_return("4")
    expect(io).to receive(:puts).with("Here is your result:")
    expect(io).to receive(:puts).with("3 - 4 = -1")

    iterative_calculator = IterativeCalculator.new(io)
    iterative_calculator.run
  end
end