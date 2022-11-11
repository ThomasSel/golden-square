require "todo_list"

RSpec.describe ToDoList do
  context "No tasks added" do
    todo_list = ToDoList.new
    it "returns an empty array" do
      expect(todo_list.show_list).to eq []
    end

    it "raises error when trying to mark off task" do
      error_message = 'ToDo task "Make dinner" not set'
      expect { todo_list.mark_complete("Make dinner") }.to raise_error error_message
    end
  end

  describe "#add_todo" do
    context "Trying to add an empty task" do
      it "raises empty string error" do
        todo_list = ToDoList.new
        error_message = "Empty string is not a todo item"
        expect { todo_list.add_todo("") }.to raise_error error_message
      end
    end

    context "Adding one task" do
      it "shows array with the task" do
        todo_list = ToDoList.new
        todo_list.add_todo("Clean the dishes")
        expect(todo_list.show_list).to eq ["Clean the dishes"]
      end
    end

    context "Adding two tasks" do
      it "shows array with both tasks" do
        todo_list = ToDoList.new
        todo_list.add_todo("Make dinner")
        todo_list.add_todo("Clean the dishes")
        expect(todo_list.show_list).to eq ["Make dinner", "Clean the dishes"]
      end
    end

    context "Adding duplicate todo task" do
      it "throws an duplicate error" do
        todo_list = ToDoList.new
        todo_list.add_todo("Make dinner")
        error_message = 'ToDo item "Make dinner" already exists'
        expect { todo_list.add_todo("Make dinner") }.to raise_error error_message
      end
    end
  end

  describe "#mark_complete" do
    context "Removing task already in the list" do
      it "no longer shows that task" do
        todo_list = ToDoList.new
        todo_list.add_todo("Make dinner")
        todo_list.add_todo("Clean the dishes")
        todo_list.mark_complete("Clean the dishes")
        expect(todo_list.show_list).to eq ["Make dinner"]
      end
    end

    context "Removing task not in the list" do
      it "raises error" do
        todo_list = ToDoList.new
        todo_list.add_todo("Make dinner")
        todo_list.add_todo("Clean the dishes")
        error_message = 'ToDo task "Take out the bins" not set'
        expect { todo_list.mark_complete("Take out the bins") }.to raise_error error_message
      end
    end
  end
end