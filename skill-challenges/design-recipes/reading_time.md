# reading_time Method Design Recipe

## 1. Describe the Problem

As a user
So that I can manage my time
I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

## 2. Design the Method Signature

Method: `reading_time`

```ruby
# `reading_time` estimates time it would take to read a string at 200 words per minute
# Returns an array [minutes, seconds] it would take to read the text (seconds are rounded up)
# Returns [0,0] for an empty string
estimated_time = reading_time(text)

text: a string (e.g. "Some example text")
estimated_time: an array (e.g. [0, 1])

# The method doesn't print anything or have any other side-effects
```

## 3. Create Examples as Tests

```ruby
reading_time("Hello, World!") => [0, 1]
reading_time("This text contains 12 words and should take 4 seconds to read") => [0, 4]
reading_time(random_input) => [1, 0] # Where random_input is a string with 200 random words
reading_time("Lorem Ipsum [...]") => [2, 6] # We assume this text is 438 words long (we could use random words)
reading_time("") => [0, 0]
reading_time(nil) throws an error
```
