class DiaryEntry
  def initialize(contents) # contents is a string
    @contents = contents
  end

  def contents
    return @contents
  end

  def count_words
    return @contents.split(" ").length
  end

  def reading_time(wpm)
    fail "Reading time cannot be 0 or less" if wpm <= 0
    return (count_words / wpm.to_f).ceil
  end

  def extract_numbers
    return @contents.scan(/[0-9]{11}/)
  end
end