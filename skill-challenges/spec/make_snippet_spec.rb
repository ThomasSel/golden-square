require "make_snippet"

RSpec.describe "make_snippet method" do
  it "Return string for one word input" do
    expect(make_snippet("A")).to eq "A"
  end

  it "Returns string for two word input" do
    expect(make_snippet("A long")).to eq "A long"
  end

  it "Truncates long ssentence after 5 words" do
    expect(make_snippet("A long long long long long sentence.")).to eq "A long long long long..."
  end
end