require "count_words"

RSpec.describe "count_words method" do
  context "Empty string" do
    it "returns 0" do
      expect(count_words("")).to eq 0
    end
  end

  context "String with 1 word (no spaces)" do
    it "returns 1" do
      expect(count_words("NoSpacesInThisString")).to eq 1
    end
  end
  
  context "String with 3 words" do
    it "returns 3" do
      expect(count_words("one two three")).to eq 3
    end
  end

  context "String with 5 words" do
    it "returns 5" do
      expect(count_words("one two three four five")).to eq 5
    end
  end
end