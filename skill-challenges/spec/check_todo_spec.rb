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

  context "input '#TODO Do the dishes'" do
    it "returns true" do
      expect(check_todo("#TODO Do the dishes")).to eq true
    end
  end

  context "input '#ToDo Do the dishes'" do
    it "returns false" do
      expect(check_todo("#ToDo Do the dishes")).to eq false
    end
  end

  context "input 'Do the dishes #TODO'" do
    it "returns true" do
      expect(check_todo("Do the dishes #TODO")).to eq true
    end
  end

  context "input 'Do the dishes #todo'" do
    it "returns false" do
      expect(check_todo("Do the dishes #todo")).to eq false
    end
  end

  context "input 'Do the #TODO dishes'" do
    it "returns true" do
      expect(check_todo("Do the #TODO dishes")).to eq true
    end
  end

  context "input 'Do the dis#TODOhes'" do
    it "returns true" do
      expect(check_todo("Do the dis#TODOhes")).to eq true
    end
  end
end