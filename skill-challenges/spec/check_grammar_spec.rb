require "check_grammar"

RSpec.describe "check_grammar method" do
  context "empty string" do
    it "returns true" do
      expect(check_grammar("")).to eq true
    end
  end
  
  context "capitalized string with no ending punctuation" do
    it "returns false" do
      expect(check_grammar("Hello world")).to eq false
    end
  end

  context "capitalized string with ending punctuation" do
    ".?!".chars.each do |char|
      it "#{char} returns true" do
        expect(check_grammar("Hello world" + char)).to eq true
      end
    end

    ";+".chars.each do |char|
      it "#{char} returns true" do
        expect(check_grammar("Hello world" + char)).to eq false
      end
    end
  end
end