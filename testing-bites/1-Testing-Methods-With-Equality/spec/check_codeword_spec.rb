require "check_codeword"

RSpec.describe "check_codeword method" do
  it "Returns success message for \"horse\" codeword" do
    expect(check_codeword("horse")).to eq "Correct! Come in."
  end

  it "Returns close message for \"house\" codeword" do
    expect(check_codeword("house")).to eq "Close, but nope."
  end

  it "Return failure message for \"hello world\" codeword" do
    expect(check_codeword("hello world")).to eq "WRONG!"
  end
end