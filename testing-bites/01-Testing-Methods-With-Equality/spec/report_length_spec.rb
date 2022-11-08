require "report_length"

RSpec.describe "report_length method" do

  it "Testing when string length is 1 output 1 in sentence" do
    result = report_length("a")
    expect(result).to eq "This string was 1 characters long."
  end

  it "Testing when string length is 2 output 2 in sentence" do
    result = report_length("it")
    expect(result).to eq "This string was 2 characters long."
  end

  it "Testing when string length is 5 output 5 in sentence" do
    result = report_length("aaaaa")
    expect(result).to eq "This string was 5 characters long."
  end
end

