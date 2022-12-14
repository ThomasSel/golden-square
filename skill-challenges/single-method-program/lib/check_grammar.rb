def check_grammar(text)
  fail "ERROR - Input cannot be nil" if text.nil?
  return true if text == ""

  is_capitalized = text.chars.first == text.chars.first.upcase
  is_punctuated = ".?!".include?(text.chars.last)
  return is_capitalized && is_punctuated
end