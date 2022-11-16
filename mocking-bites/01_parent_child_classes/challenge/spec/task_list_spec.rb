require "task_list"

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  it "#all returns a list of all tasks" do
    task_list = TaskList.new
    task_1 = double(:task)
    task_2 = double(:task)
    task_3 = double(:task)
    task_list.add(task_1)
    task_list.add(task_2)
    task_list.add(task_3)
    expect(task_list.all).to eq [task_1, task_2, task_3]
  end

  context "#complete" do
    it "returns false if list is empty" do
      task_list = TaskList.new
      expect(task_list.all_complete?).to eq false
    end

    it "returns false if one task ins't complete" do
      task_list = TaskList.new
      task_1 = double(:task, complete?: true)
      task_2 = double(:task, complete?: false)
      task_3 = double(:task, complete?: true)
      task_list.add(task_1)
      task_list.add(task_2)
      task_list.add(task_3)
      expect(task_list.all_complete?).to eq false
    end

    it "returns true if all tasks are complete" do
      task_list = TaskList.new
      task_1 = double(:task, complete?: true)
      task_2 = double(:task, complete?: true)
      task_3 = double(:task, complete?: true)
      task_list.add(task_1)
      task_list.add(task_2)
      task_list.add(task_3)
      expect(task_list.all_complete?).to eq true
    end
  end
end
