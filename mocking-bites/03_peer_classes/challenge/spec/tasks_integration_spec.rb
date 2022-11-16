require "task_list"
require "task"
require "task_formatter"

RSpec.describe "tasks integration" do
  it "adds tasks to a list" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end

  it "marks tasks as complete" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    task_1.mark_complete
    task_2.mark_complete
    expect(task_list.all_complete?).to eq true
  end

  describe "TaskFormatter and Task" do
    context "task hasn't been completed" do
      it "formats the task without a cross" do
        task = Task.new("my_title")
        task_formatter = TaskFormatter.new(task)
        expect(task_formatter.format).to eq "- [ ] my_title"
      end
    end
    
    context "task is complete" do
      it "formats the task with a cross" do
        task = Task.new("my_title")
        task_formatter = TaskFormatter.new(task)
        task.mark_complete
        expect(task_formatter.format).to eq "- [x] my_title"
      end
    end
  end
end
