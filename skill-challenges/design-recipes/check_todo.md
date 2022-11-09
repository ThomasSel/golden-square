# Todo Checker Method Design Recipe

## 1. Describe the Problem

> As a user
> So that I can keep track of my tasks
> I want to check if a text includes the string `#TODO`.

## 2. Design the Method Signature

```ruby
# `check_todo` method checks whether the input string contains the substring "#TODO"
contains_todo = check_todo(text)

text: a string (e.g. "This string contains #TODO")
contains_todo: a boolean (e.g. true)

# The method doesn't print anything or have any other side-effects
```

## 3. Create Examples as Tests

```ruby
check_todo("") => false
check_todo("Hello, world!") => false
check_todo("#TODO") => true
check_todo("#TODO Do the dishes") => true
check_todo("#ToDo Do the dishes") => false
check_todo("Do the dishes #TODO") => true
check_todo("Do the dishes #todo") => false
check_todo("Do the #TODO dishes") => true
check_todo("Do the dis#TODOhes") => true
```
