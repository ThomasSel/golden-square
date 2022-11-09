require "check_todo"

RSpec.describe "check_todo method" do
  context "input 'empty string'" do
    it "returns false" do
      expect(check_todo("")).to eq false
    end
  end

  context "input 'Hello, world!'" do
    it "returns false" do
      expect(check_todo("Hello, world!")).to eq false
    end
  end

  context "input '#TODO'" do
    it "returns true" do
      expect(check_todo("#TODO")).to eq true
    end
  end
end