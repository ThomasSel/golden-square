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
│    Diary:           │
│                     │
│ - add               │
│                     │
│ - all               │
│                     │
│ - readable_entries  │-------------
│                     │             |
└─────────┬───────────┘             |
          │                         |
          │                         |
          |                ┌────────▼─────────┐
          |                │                  │
          |                │    Contacts:     │
          |                │                  │
          |                │ - list           │
          |                │                  │
          |                │ - get_numbers    │
          |                │                  │
          |                └──────────────────┘
          |
  ┌───────▼─────────┐
  │                 │
  │     TodoList:   │
  │                 │
  │ - tasks         │
  │                 │
  │ - add           │
  │                 │
  └─────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
  end

  def add_entry(entry) # entry is a string
    # returns nothing
  end

  def add_todo(task) # todo is a string
  # returns nothing
  end

  def show_todo
  # returns array of tasks
  end

  def all
    # returns a list of all the entries
  end

  def readable_entries(wpm, reading_time) # wpm and reading_time are integers
    # returns entries that I can read in the time given
  end

end

class Contacts
  def initialize
  end

  def list
    # returns a list of phone numbers
  end

  def get_numbers(diary) # diary is an instance of the diary class
    # returns nothing
  end
end

class TodoList
  def initialize
  end

  def tasks
    # returns a list of tasks
  end

  def add(task) # task is a string
    # returns nothing
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
diary = Diary.new
diary.add_entry("This is a phone number: 07414927478")
diary.add_entry("Two phone numbers: 09876543210 12345678901")
contacts = Contacts.new
contacts.get_numbers(diary)
contacts.list
expect => ["07414927478", "09876543210", "12345678901"]

diary = Diary.new
diary.add_todo("groceries")
diary.add_todo("do dishes")
diary.show_todo
expect => ["groceries", "do dishes"]

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
contacts = Comtacts.new
contacts.list
expect => []

todo_list = TodoList.new
todo_list.tasks
expect => []

todo_list = TodoList.new
todo_list.add("groceries")
todo_list.add("do dishes")
todo_list.tasks
expect => ["groceries", "do dishes"]

diary = Diary.new
diary.all
expect => []

diary = Diary.new
diary.add_entry("entry_1")
diary.add_entry("entry_2")
diary.all
expect => ["entry_1", "entry_2"]

diary = Diary.new
diary.add_entry("short entry")
diary.add_entry("This is a longer entry")
diary.add_entry("one " * 100)
diary.readable_entries(10, 1)
expect => ["This is a longer entry", "short entry"]

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
