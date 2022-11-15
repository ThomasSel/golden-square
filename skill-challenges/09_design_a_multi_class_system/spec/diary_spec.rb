require "diary"

RSpec.describe Diary do
  context "Initialized diary" do
    it "all methods return an empty array" do
      diary = Diary.new
      expect(diary.list_entries).to eq []
      expect(diary.list_tasks).to eq []
      expect(diary.readable_entries(10, 1)).to eq []
      expect(diary.list_contacts).to eq []
      expect(diary.completed_tasks).to eq []
    end
  end
end