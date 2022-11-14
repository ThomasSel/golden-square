require "diary"

RSpec.describe Diary do
  context "Initialized diary" do
    it "has an empty array" do
      diary = Diary.new
      expect(diary.all).to eq []
    end

    it "count words returns 0" do
      diary = Diary.new
      expect(diary.count_words).to eq 0
    end

    it "returns 0 when reading_time is called with no entries" do
      diary = Diary.new
      expect(diary.reading_time(2)).to eq 0
    end

    it "raises error when wpm is 0" do
      diary = Diary.new
      expect{diary.reading_time(0)}.to raise_error "This person can not read"
    end

    it "returns nil when calling find_best_entry" do
      diary = Diary.new
      expect(diary.find_best_entry_for_reading_time(5,10)).to eq nil
    end

    it "raises error when wpm is 0" do
      diary = Diary.new
      expect{diary.find_best_entry_for_reading_time(0,5)}.to raise_error "This person can not read"
    end
  end
end