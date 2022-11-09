# `check_grammar` Method Design Recipe

## 1. Describe the Problem

> As a user
> So that I can improve my grammar
> I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

## 2. Design the Method Signature

```ruby
# `check_grammar` checks if text starts with a capital letter and ends with appropriate punctuation
# Note at check_grammar should return true if the text is empty
has_good_grammar = check_grammar(text)

text: a string (e.g. "Hello, world!")
has_good_grammar: a boolean (e.g. true)

# The method doesn't print anything or have any other side-effects
```

## 3. Create Examples as Tests

```ruby
check_grammar("") => true
check_grammar("Hello world") => false
check_grammar("Hello world.") => true
check_grammar("Hello world!") => true
check_grammar("Hello world?") => true
check_grammar("Hello world;") => false
check_grammar("Hello world+") => false
check_grammar("hello world.") => false
check_grammar("hello world!") => false
check_grammar("hello world?") => false
check_grammar("This sentence has good grammar. The second sentence doesn't end with punctation") => false
check_grammar("This sentence has good grammar. the second sentence doesn't start with a capital!") => true
check_grammar(nil) throws an error
```
