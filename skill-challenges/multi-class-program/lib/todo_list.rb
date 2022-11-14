class TodoList
    def initialize
        @list = []
    end
  
    def add(todo) # todo is an instance of Todo
      @list << todo
    end
  
    def incomplete
      return @list.select{|todo| !todo.done?}
    end
  
    def complete
      return @list.select{|todo| todo.done?}
    end
  
    def give_up!
      @list.each do |todo|
        todo.mark_done!
      end
    end
  end
