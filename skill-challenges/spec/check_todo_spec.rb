require "check_todo"

RSpec.describe "check_todo method" do
  context "empty string" do
    it "returns false" do
      expect(check_todo("")).to eq false
    end
  end
end