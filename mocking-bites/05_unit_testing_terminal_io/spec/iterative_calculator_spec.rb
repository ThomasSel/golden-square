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

  it "calculator runs with correct io for negative input" do
    io = double(:io)
    expect(io).to receive(:puts).with("Hello. I will subtract two numbers.")
    expect(io).to receive(:puts).with("Please enter a number")
    expect(io).to receive(:gets).and_return("-3")
    expect(io).to receive(:puts).with("Please enter another number")
    expect(io).to receive(:gets).and_return("4")
    expect(io).to receive(:puts).with("Here is your result:")
    expect(io).to receive(:puts).with("-3 - 4 = -7")

    iterative_calculator = IterativeCalculator.new(io)
    iterative_calculator.run
  end

  it "calculator runs with correct io for zero input" do
    io = double(:io)
    expect(io).to receive(:puts).with("Hello. I will subtract two numbers.")
    expect(io).to receive(:puts).with("Please enter a number")
    expect(io).to receive(:gets).and_return("3")
    expect(io).to receive(:puts).with("Please enter another number")
    expect(io).to receive(:gets).and_return("0")
    expect(io).to receive(:puts).with("Here is your result:")
    expect(io).to receive(:puts).with("3 - 0 = 3")

    iterative_calculator = IterativeCalculator.new(io)
    iterative_calculator.run
  end

  it "raises an error if we make the first input a string" do
    io = double(:io)
    expect(io).to receive(:puts).with("Hello. I will subtract two numbers.")
    expect(io).to receive(:puts).with("Please enter a number")
    expect(io).to receive(:gets).and_return("Hello, World!")

    iterative_calculator = IterativeCalculator.new(io)
    expect { iterative_calculator.run }.to raise_error "You must input a number"
  end

  it "raises an error if we make the second input a string" do
    io = double(:io)
    expect(io).to receive(:puts).with("Hello. I will subtract two numbers.")
    expect(io).to receive(:puts).with("Please enter a number")
    expect(io).to receive(:gets).and_return("Hello, World!")

    iterative_calculator = IterativeCalculator.new(io)
    expect { iterative_calculator.run }.to raise_error "You must input a number"
  end
end