class Task
  def initialize(contents)
    @contents = contents
    @is_complete = false
  end

  def contents
    return @contents
  end

  def mark_complete!
    @is_complete = true
  end

  def complete?
    return @is_complete
  end
end