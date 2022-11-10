def reading_time(text)
  fail "ERROR - Input cannot be nil" if text.nil?
  words_per_second = 200 / 60.0
  number_of_words = text.split(' ').length
  return [
    number_of_words / 200,
    (number_of_words / words_per_second).ceil % 60
  ]
end