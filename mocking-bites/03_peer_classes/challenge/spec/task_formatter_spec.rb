require "task_formatter"

RSpec.describe TaskFormatter do
  context "task is complete" do
    it "formats the task with a cross" do
      task = double(:task, complete?: true, title: "my_title")
      task_formatter = TaskFormatter.new(task)
      expect(task_formatter.format).to eq "- [x] my_title"
    end
  end

  context "task hasn't been completed" do
    it "formats the task without a cross" do
      task = double(:task, complete?: false, title: "my_title")
      task_formatter = TaskFormatter.new(task)
      expect(task_formatter.format).to eq "- [ ] my_title"
    end
  end
end