# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._
> As a user
> So that I can record my experiences
> I want to keep a regular diary

> As a user
> So that I can reflect on my experiences
> I want to read my past diary entries

> As a user
> So that I can reflect on my experiences in my busy day
> I want to select diary entries to read based on how much time I have and my reading speed

> As a user
> So that I can keep track of my tasks
> I want to keep a todo list along with my diary

> As a user
> So that I can keep track of my contacts
> I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌─────────────────────┐
│                     │
│  Diary              │
│                     │
│ - add_entry         │
│                     │
│ - add_task          │
│                     │
│ - list_entries      │
│                     │
│ - list_tasks        │
│                     │
│ - readable_entries  │
│                     │
│ - list_contacts     │
│                     │
│ - completed_tasks   │
│                     ├─────────────────┐
└─────────┬───────────┘                 │
          │                             │
          │                             │
          ▼                             ▼
┌─────────────────────┐     ┌───────────────────────┐
│                     │     │                       │
│  DiaryEntry:        │     │  Task:                │
│                     │     │                       │
│ - count_words       │     │ - contents            │
│                     │     │                       │
│ - reading_time      │     │ - mark_complete!      │
│                     │     │                       │
│ - contents          │     │ - complete?           │
│ - extract_numbers   │     │                       │
└─────────────────────┘     └───────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
  end

  def add_entry(entry) # entry is a DiaryEntry instance
    # adds entry to diary AND exctracts phone numbers within the entry
    # returns nothing
  end

  def add_task(task) # todo is a Task instance
    # returns nothing
  end

  def list_entries
    # returns array of entries
  end
  
  def list_tasks
    # returns array of pending tasks
  end

  def list_contacts
    # returns array of phone numbers
  end

  def readable_entries(wpm, reading_time) # wpm and reading_time are integers
    # returns entries that I can read in the time given
  end

  def completed_tasks
    # returns a list of completed tasks
  end

end

class DiaryEntry
  def initialize(contents) # contents is a string
  end

  def contents
    # returns the contents of the entry
  end

  def count_words
    # returns an integer: number of words in the entry
  end

  def reading_time(wpm) # wpm is an integer
    # returns and integer reperesenting the number of minutes
    # to read the entry at a given wpm and time
  end

  def extract_numbers
    # return a list of phone numbers in the contents
  end
end

class Task
  def initialize(contents) # contents is a string
  end

  def contents
    # returns the contents
  end

  def mark_complete!
    # returns nothing
  end

  def complete?
    # return true if complete, false otherwise
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
diary = Diary.new
entry_1 = DiaryEntry.new("This is a phone number: 07414927478")
entry_2 = DiaryEntry.new("Two phone numbers: 09876543210 12345678901")
diary.add_entry(entry_1)
diary.add_entry(entry_2)
diary.list_entries # => [entry_1, entry_2]

diary = Diary.new
task_1 = Task.new("groceries")
task_2 = Task.new("do the dishes")
diary.add_task(task_1)
diary.add_task(task_2)
diary.list_tasks # => [task_1, task_2]

diary = Diary.new
task_1 = Task.new("groceries")
task_2 = Task.new("do the dishes")
diary.add_task(task_1)
diary.add_task(task_2)
task_1.mark_complete!
diary.completed_tasks # => [task_1]
diary.list_tasks # => [task_2]

diary = Diary.new
entry_1 = DiaryEntry.new("This is a phone number: 07414927478")
entry_2 = DiaryEntry.new("Two phone numbers: 09876543210 12345678901")
diary.add_entry(entry_1)
diary.add_entry(entry_2)
diary.list_contacts # => ["07414927478", "09876543210", "12345678901"]

diary = Diary.new
entry_1 = DiaryEntry.new("This is a phone number: 07414927478")
diary.add_entry(entry_1)
diary.add_entry(entry_1)
diary.list_contacts # => ["07414927478"]

diary = Diary.new
entry_1 = DiaryEntry.new("Short entry")
entry_2 = DiaryEntry.new("This is a longer entry")
entry_3 = DiaryEntry.new("one " * 100)
diary.add_entry(entry_1)
diary.add_entry(entry_2)
diary.add_entry(entry_3)
diary.readable_entries(10, 1) # => [entry_2, entry_1]

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# DiaryEntry
entry = DiaryEntry.new("Some contents")
entry.contents # => "Some contents"

entry = DiaryEntry.new("Some contents")
entry.count_words # => 2

entry = DiaryEntry.new("Two phone numbers: 09876543210 12345678901")
entry.reading_time(2) # => 3

entry = DiaryEntry.new("Two phone numbers: 09876543210 12345678901")
entry.reading_time(0) # throws an error "reading time cannot be 0 or less"

entry = DiaryEntry.new("No phone numbers in this entry")
entry.extract_numbers # => []

entry = DiaryEntry.new("Two phone numbers: 09876543210 12345678901")
entry.extract_numbers # => ["09876543210", "12345678901"]


# Task
task = Task.new("do the dishes")
task.contents # => "do the dishes"

task = Task.new("do the dishes")
task.complete? # => false

task = Task.new("do the dishes")
task.mark_complete!
task.complete? # => true


# Diary
diary = Diary.new
diary.list_entries # => []

diary = Diary.new
diary.list_tasks # => []

diary = Diary.new
diary.readable_entries(10, 1) # => []

diary = Diary.new
diary.list_contacts # => []

diary = Diary.new
diary.completed_tasks # => []
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._

