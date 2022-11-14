class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @furthestwordread = 0
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split(" ").length
  end

  def reading_time(wpm) 
    fail "This person can not read" if wpm <= 0
    count_words / wpm
  end

  def reading_chunk(wpm, minutes) 
    words_in_contents = @contents.split(" ")
    words_read = wpm * minutes # wpm (50) * minutes (2) = 100 words

    begin_at = @furthestwordread
    end_at = words_read + begin_at
    @furthestwordread = end_at
    if end_at >= count_words
      @furthestwordread = 0
    end
    words_in_contents[begin_at...end_at].join(" ")

    # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end
end