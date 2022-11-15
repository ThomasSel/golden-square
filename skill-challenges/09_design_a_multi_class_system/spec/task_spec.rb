require "task"

RSpec.describe Task do
  it "returns the contents of the task" do
    task = Task.new("do the dishes")
    expect(task.contents).to eq "do the dishes"
  end

  context "after initialization" do
    it "task is still not complete" do
      task = Task.new("do the dishes")
      expect(task.complete?).to eq false
    end
  end

  context "Afteer marking the task complete" do
    it "complete? returns true" do
      task = Task.new("do the dishes")
      task.mark_complete!
      expect(task.complete?).to eq true
    end
  end
end