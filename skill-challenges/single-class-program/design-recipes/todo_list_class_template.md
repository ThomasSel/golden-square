# ToDo list Class Design Recipe

## 1. Describe the Problem

> As a user
> So that I can keep track of my tasks
> I want a program that I can add todo tasks to and see a list of them.

> As a user
> So that I can focus on tasks to complete
> I want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class Interface

```ruby
class ToDoList
  def initialize # No input
    # ...
  end

  def add_todo(todo) # todo is a string
    # Throws an error if todo is an empty string
    # Throws an error if todo is already part of the list
    # No return value
  end

  def show_list # No input
    # Returns the todo list
  end

  def mark_complete(todo) # todo is a string
    # Throws an error if it cannot find the task
    # Otherwise no return value
  end
end
```

## 3. Create Examples as Tests

```ruby
# 1
todo_list = ToDoList.new
todo_list.show_list # => []

# 2
todo_list = ToDoList.new
todo_list.mark_complete("Make dinner") # Throws error: "ToDo task "Make dinner" not set"

# 3
todo_list = ToDoList.new
todo_list.add_todo("") # => Throws error: "Empty string is not a todo item"

# 4
todo_list = ToDoList.new
todo_list.add_todo("Clean the dishes")
todo_list.show_list # => ["Clean the dishes"]

# 5
todo_list = ToDoList.new
todo_list.add_todo("Make dinner")
todo_list.add_todo("Clean the dishes")
todo_list.show_list # => ["Make dinner", "Clean the dishes"]

# 6
todo_list = ToDoList.new
todo_list.add_todo("Make dinner")
todo_list.add_todo("Make dinner") # => Throws error: "ToDo item "Make Dinner" already exists"

# 7
todo_list = ToDoList.new
todo_list.add_todo("Make dinner")
todo_list.add_todo("Clean the dishes")
todo_list.mark_complete("Clean the dishes")
todo_list.show_list # => ["Make dinner"]

# 8
todo_list = ToDoList.new
todo_list.add_todo("Make dinner")
todo_list.add_todo("Clean the dishes")
todo_list.mark_complete("Take out the bins") # Throws error: "ToDo task "Take out the bins" not set
```