require "diary"
require "diary_entry"

RSpec.describe "integration" do
  context "Add entry to diary" do
    it "adds entry into array" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("my_title", "my_contents")
      diary.add(diary_entry)
      expect(diary.all).to eq [diary_entry]
    end
  end

  context "#count_word" do
    it "returns the sum of the length of all the entries" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title", "my contents")
      diary_entry_2 = DiaryEntry.new("my title", "End of week one")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.count_words).to eq 6
    end
  end

  context "#reading_time" do
    it "returns the estimated reading time to read the whole diary" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title", "my contents")
      diary_entry_2 = DiaryEntry.new("my title", "End of week one")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.reading_time(2)).to eq 3
    end

    it "raises error when words per minute is 0" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title", "my contents")
      diary_entry_2 = DiaryEntry.new("my title", "End of week one")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect{diary.reading_time(0)}.to raise_error "This person can not read"
    end
  end

  context "#find_best_entry_for_reading_time" do
    it "should return the longest readable entry based on wpm and minutes" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title", "my contents")
      diary_entry_2 = DiaryEntry.new("my title", "End of week one")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.find_best_entry_for_reading_time(2, 1)).to eq diary_entry_1
    end

    it "should return the longest readable entry based on wpm and minutes" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title", "my contents")
      diary_entry_2 = DiaryEntry.new("my title", "End of week one")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.find_best_entry_for_reading_time(5, 1)).to eq diary_entry_2
    end

    it "should return the longest readable entry based on wpm and minutes" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title", "my contents")
      diary_entry_2 = DiaryEntry.new("my title", "End of week one")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.find_best_entry_for_reading_time(1, 1)).to eq nil
    end
  end
end