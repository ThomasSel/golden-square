# Track List Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can keep track of my music listening
> I want to add tracks I've listened to and see a list of them.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
class TrackList
    def initialize
    end

    def add(track) # track is a string
        # Fails if track is an empty string
        # Returns nothing
    end

    def view_tracks
        # Return the list of tracks
    end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# 1
track_list = TrackList.new
tack_list.view_tracks # => []

# 2
track_list = TrackList.new
track_list.add("track_1")
track_list.view_tracks # => ["track_1"]

# 3
track_list = TrackList.new
track_list.add("track_1")
track_list.add("track_2")
track_list.view_tracks # => ["track_1", "track_2"]

# 4
track_list = TrackList.new
track_list.add("") # fails
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._


