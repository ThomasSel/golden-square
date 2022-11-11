require "diary_entry"

RSpec.describe DiaryEntry do
  it "Adds a title as a string" do
    diary = DiaryEntry.new("A Title", "Some content")
    expect(diary.title).to eq "A Title"
    expect(diary.contents).to eq "Some content"
  end

  it "Returns the number of words in the contents as an integer" do
    diary_entry = DiaryEntry.new("A Title", "Some content")
    expect(diary_entry.count_words).to eq 2
  end
  
  context "Reading time" do
    it "at 200 wpm it returns 1" do
      diary_entry = DiaryEntry.new("A Title", "content " * 200)
      expect(diary_entry.reading_time(200)).to eq 1
    end

    it "at 200 wpm it returns 2" do
      diary_entry = DiaryEntry.new("A Title", "content " * 300)
      expect(diary_entry.reading_time(200)).to eq 2
    end 

    it "at 400 wpm it returns 1" do
      diary_entry = DiaryEntry.new("A Title", "content " * 300)
      expect(diary_entry.reading_time(400)).to eq 1
    end 
  end 

  context "Reading chunk" do
    it "reads a 2 minute chunk @ 50 wpm" do
      diary_entry = DiaryEntry.new("A Title", "content " * 300)
      expect(diary_entry.reading_chunk(50, 2)).to eq "content " * 100
    end
    it "reads a 2 minute chunk @ 50 wpm and then a 100 words chunk @ 100 wpm" do
      diary_entry = DiaryEntry.new("A Title", "one " * 100 + "two " * 200)
      expect(diary_entry.reading_chunk(50, 2)).to eq "one " * 100
      expect(diary_entry.reading_chunk(100, 1)).to eq "two " * 100
    end 
    it "resets after content is fully read" do
      diary_entry = DiaryEntry.new("A Title", "one " * 100 + "two " * 50)
      expect(diary_entry.reading_chunk(50, 2)).to eq "one " * 100
      expect(diary_entry.reading_chunk(100, 1)).to eq "two " * 50
      expect(diary_entry.reading_chunk(50, 2)).to eq "one " * 100
    end 
  end
end