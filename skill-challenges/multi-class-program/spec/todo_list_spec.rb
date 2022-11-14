require "todo_list"

RSpec.describe TodoList do
  context "incomplete" do
    it "returns incomplete tasks" do
      todo_list = TodoList.new
      expect(todo_list.incomplete).to eq []
    end
  end

  context "complete" do
    it "returns complete tasks" do
      todo_list = TodoList.new
      expect(todo_list.complete).to eq []
    end
  end
end