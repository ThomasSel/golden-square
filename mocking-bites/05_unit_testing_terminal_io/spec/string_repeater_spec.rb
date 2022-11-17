require "string_repeater"

RSpec.describe StringRepeater do
  it "repeats a string in the terminal" do
    io = double("io")

    expect(io).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(io).to receive(:puts).with("Please enter a string").ordered
    expect(io).to receive(:gets).and_return("TWIX\n").ordered
    expect(io).to receive(:puts).with("Please enter a number of repeats").ordered
    expect(io).to receive(:gets).and_return("10\n").ordered
    expect(io).to receive(:puts).with("Here is your result:").ordered
    expect(io).to receive(:puts).with("TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX").ordered

    string_repeater = StringRepeater.new(io)
    string_repeater.run
  end

  it "final output is empty is the string given is empty" do
    io = double("io")

    expect(io).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(io).to receive(:puts).with("Please enter a string").ordered
    expect(io).to receive(:gets).and_return("\n").ordered
    expect(io).to receive(:puts).with("Please enter a number of repeats").ordered
    expect(io).to receive(:gets).and_return("10\n").ordered
    expect(io).to receive(:puts).with("Here is your result:").ordered
    expect(io).to receive(:puts).with("").ordered

    string_repeater = StringRepeater.new(io)
    string_repeater.run
  end

  it "Final output is empty if number of repetitions is 0" do
    io = double("io")

    expect(io).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(io).to receive(:puts).with("Please enter a string").ordered
    expect(io).to receive(:gets).and_return("TWIX\n").ordered
    expect(io).to receive(:puts).with("Please enter a number of repeats").ordered
    expect(io).to receive(:gets).and_return("0\n").ordered
    expect(io).to receive(:puts).with("Here is your result:").ordered
    expect(io).to receive(:puts).with("").ordered

    string_repeater = StringRepeater.new(io)
    string_repeater.run
  end

  it "raises an error if the number of repeats is negative" do
    io = double("io")

    expect(io).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(io).to receive(:puts).with("Please enter a string").ordered
    expect(io).to receive(:gets).and_return("TWIX\n").ordered
    expect(io).to receive(:puts).with("Please enter a number of repeats").ordered
    expect(io).to receive(:gets).and_return("-10\n").ordered

    string_repeater = StringRepeater.new(io)
    expect { string_repeater.run }.to raise_error "The number of repetitions must be positive"
  end

  it "raises an error if the number of repeats is a non-numeric string" do
    io = double("io")

    expect(io).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(io).to receive(:puts).with("Please enter a string").ordered
    expect(io).to receive(:gets).and_return("TWIX\n").ordered
    expect(io).to receive(:puts).with("Please enter a number of repeats").ordered
    expect(io).to receive(:gets).and_return("Hello, World!\n").ordered

    string_repeater = StringRepeater.new(io)
    expect { string_repeater.run }.to raise_error "The number of repetitions must be a number"
  end
end
