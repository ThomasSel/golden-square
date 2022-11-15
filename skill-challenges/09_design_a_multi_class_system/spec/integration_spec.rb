require "diary"
require "diary_entry"
require "task"

RSpec.describe "Integration" do
  describe "#list_entries" do
    context "we add two entries" do
      it "returns an array with both entries" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("This is a phone number: 07414927478")
        entry_2 = DiaryEntry.new("Two phone numbers: 09876543210 12345678901")
        diary.add_entry(entry_1)
        diary.add_entry(entry_2)
        expect(diary.list_entries).to eq [entry_1, entry_2]
      end
    end
  end

  describe "#list_tasks" do
    context "we add two tasks" do
      it "returns an array with both tasks" do
        diary = Diary.new
        task_1 = Task.new("groceries")
        task_2 = Task.new("do the dishes")
        diary.add_task(task_1)
        diary.add_task(task_2)
        expect(diary.list_tasks).to eq [task_1, task_2]
      end
    end
  end

  context "We add one completed and one pending task" do
    it "completed_tasks return one task, list_task returns the other" do
      diary = Diary.new
      task_1 = Task.new("groceries")
      task_2 = Task.new("do the dishes")
      diary.add_task(task_1)
      diary.add_task(task_2)
      task_1.mark_complete!
      expect(diary.completed_tasks).to eq [task_1]
      expect(diary.list_tasks).to eq [task_2]
    end
  end

  describe "#list_contacts" do
    context "We add two entries with phone numbers" do
      it "returns an array with all the numbers" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("This is a phone number: 07414927478")
        entry_2 = DiaryEntry.new("Two phone numbers: 09876543210 12345678901")
        diary.add_entry(entry_1)
        diary.add_entry(entry_2)
        expect(diary.list_contacts).to eq ["07414927478", "09876543210", "12345678901"]
      end
    end

    context "We add a duplicate phone number" do
      it "returns and array with only one number" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("This is a phone number: 07414927478")
        diary.add_entry(entry_1)
        diary.add_entry(entry_1)
        expect(diary.list_contacts).to eq ["07414927478"]
      end
    end
  end

  describe "#readable_entries" do
    it "returns the readable entries sorted by descending length" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Short entry")
      entry_2 = DiaryEntry.new("This is a longer entry")
      entry_3 = DiaryEntry.new("one " * 100)
      diary.add_entry(entry_1)
      diary.add_entry(entry_2)
      diary.add_entry(entry_3)
      expect(diary.readable_entries(10, 1)).to eq [entry_2, entry_1]
    end
  end
end