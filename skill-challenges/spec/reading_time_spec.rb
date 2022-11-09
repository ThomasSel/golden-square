require "reading_time"

RSpec.describe "reading_time method" do
  context "empty string" do
    it "returns [0, 0]" do
      expect(reading_time("")).to eq [0, 0]
    end
  end

  context "short example (<60s)" do
    it "1 second text" do
      expect(reading_time("Hello, World!")).to eq [0, 1]
    end
    
    it "4 second text" do
      expect(reading_time("This text contains 12 words and should take 4 seconds to read")).to eq [0, 4]
    end
  end

  context "long text" do
    it "200 word text returns [1, 0]" do
      text = Array.new(200, "word").join(' ')
      expect(reading_time(text)).to eq [1, 0]
    end

    it "438 word text returns [2, 6]" do
      text = Array.new(438, "word").join(' ')
      expect(reading_time(text)).to eq [2, 12]
    end
  end

  context "error handling" do
    it "raises error for nil input" do
      expect { reading_time(nil) }.to raise_error "ERROR - Input cannot be nil"
    end
  end
end