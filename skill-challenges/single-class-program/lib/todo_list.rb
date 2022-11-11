class ToDoList
  def initialize # No input
    @list = []
  end

  def add_todo(todo) # todo is a string
    # Throws an error if todo is an empty string
    # No return value
    fail "Empty string is not a todo item" if todo == ""
    fail "ToDo item \"#{todo}\" already exists" if @list.include?(todo)

    @list << todo
  end

  def show_list # No input
    # Returns the todo list
    return @list
  end

  def mark_complete(todo) # todo is a string
    # Throws an error if it cannot find the task
    # Otherwise no return value
    fail "ToDo task \"#{todo}\" not set" unless @list.include?(todo)
    
    @list.delete(todo)
  end
end