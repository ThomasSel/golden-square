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
      it "#{char} returns false" do
        expect(check_grammar("Hello world" + char)).to eq false
      end
    end
  end

  context "uncapitalized string with valid ending punctuation" do
    ".?!".chars.each do |char|
      it "#{char} returns false" do
        expect(check_grammar("hello world" + char)).to eq false
      end
    end
  end

  context "Multi-sentence text, second sentence doesn't end with punctuation" do
    it "returns false" do
      result = check_grammar("This sentence has good grammar. The second sentence doesn't end with punctation")
      expect(result).to eq false
    end
  end

  context "Multi-sentence text, second sentence isn't capitalized" do
    it "returns true" do
      result = check_grammar("This sentence has good grammar. the second sentence doesn't start with a capital!")
      expect(result).to eq true
    end
  end
end