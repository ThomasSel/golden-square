class Diary
  def initialize
    @entries = []
    @tasks = []
    @phone_numbers = []
  end

  def add_entry(entry) 
    @phone_numbers = @phone_numbers | entry.extract_numbers
    @entries << entry
  end

  def add_task(task) # todo is a Task instance
    @tasks << task
  end

  def list_entries
    return @entries
  end
  
  def list_tasks
    return @tasks.reject(&:complete?)
  end

  def list_contacts
    return @phone_numbers
  end

  def readable_entries(wpm, reading_time) # wpm and reading_time are integers
    short_entries = @entries.select{ |entry| entry.reading_time(wpm) <= reading_time }
    return short_entries.sort_by(&:count_words).reverse
  end

  def completed_tasks
    return @tasks.select(&:complete?)
  end

end