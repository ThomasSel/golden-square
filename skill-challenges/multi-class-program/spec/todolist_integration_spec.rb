require 'todo'
require 'todo_list'

describe 'todo list integration' do
    context 'add one todo' do
        it 'incomplete returns the todo' do
            todo_list = TodoList.new
            todo = Todo.new("my todo")
            todo_list.add(todo)
            expect(todo_list.incomplete).to eq [todo]
            expect(todo_list.complete).to eq []
        end

        it 'complete returns the todo after marking it done' do
            todo_list = TodoList.new
            todo = Todo.new("my todo")
            todo_list.add(todo)
            todo.mark_done!
            expect(todo_list.incomplete).to eq []
            expect(todo_list.complete).to eq [todo]
        end
    end

    context 'add two todos' do
        it 'incomplete returns two todos' do
            todo_list = TodoList.new
            todo_1 = Todo.new("my todo")
            todo_2 = Todo.new("my todo")
            todo_list.add(todo_1)
            todo_list.add(todo_2)
            expect(todo_list.incomplete).to eq [todo_1, todo_2]
            expect(todo_list.complete).to eq []
        end

        it 'incomplete returns 1 todo, complete returns the other' do
            todo_list = TodoList.new
            todo_1 = Todo.new("my todo")
            todo_2 = Todo.new("my todo")
            todo_list.add(todo_1)
            todo_list.add(todo_2)
            todo_2.mark_done!
            expect(todo_list.incomplete).to eq [todo_1]
            expect(todo_list.complete).to eq [todo_2]
        end
    end

    context "#give_up!" do
        it "marks all todos as complete" do
            todo_list = TodoList.new
            todo_1 = Todo.new("my todo")
            todo_2 = Todo.new("my todo")
            todo_list.add(todo_1)
            todo_list.add(todo_2)
            todo_list.give_up!
            expect(todo_list.incomplete).to eq []
            expect(todo_list.complete).to eq [todo_1, todo_2]
        end

        it "marks all todos as complete even if they're already done" do
            todo_list = TodoList.new
            todo_1 = Todo.new("my todo")
            todo_2 = Todo.new("my todo")
            todo_list.add(todo_1)
            todo_list.add(todo_2)
            todo_1.mark_done!
            todo_list.give_up!
            expect(todo_list.incomplete).to eq []
            expect(todo_list.complete).to eq [todo_1, todo_2]
        end
    end
end