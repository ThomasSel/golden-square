require 'todo'

RSpec.describe Todo do
    context 'initializes todo' do
        it 'returns the task as a string' do
            todo = Todo.new("my task")
            expect(todo.task).to eq "my task"
        end

        it 'done? returns false' do
            todo = Todo.new("my task")
            expect(todo.done?).to eq false
        end
    end

    context '#mark_done!' do
        it 'marks todo as done' do
            todo = Todo.new("my task")
            todo.mark_done!
            expect(todo.done?).to eq true
        end 
    end

end
