require "diary_entry.rb"

RSpec.describe DiaryEntry do
  it "returns the contents of the entry" do
    entry = DiaryEntry.new("Some contents")
    expect(entry.contents).to eq "Some contents"
  end

  it "returns the number of words in the entry" do
    entry = DiaryEntry.new("Some contents")
    expect(entry.count_words).to eq 2
  end

  describe "#reading_time" do
    context "contents has 5 words" do
      it "takes 3 minutes to read at 2 wpm" do
        entry = DiaryEntry.new("Two phone numbers: 09876543210 12345678901")
        expect(entry.reading_time(2)).to eq 3
      end
    end

    it "fails if wpm is 0" do
      entry = DiaryEntry.new("Two phone numbers: 09876543210 12345678901")
      expect { entry.reading_time(0) }.to raise_error "Reading time cannot be 0 or less"

    end
  end

  describe "#extract_numbers" do
    context "Contents has no number" do
      it "returns an empty array" do
        entry = DiaryEntry.new("No phone numbers in this entry")
        expect(entry.extract_numbers).to eq []
      end
    end

    context "Contents has phone numbers in it" do
      it "returns an array with all the numbers as strings" do
        entry = DiaryEntry.new("Two phone numbers: 09876543210 12345678901")
        expect(entry.extract_numbers).to eq ["09876543210", "12345678901"]
      end
    end
  end
end