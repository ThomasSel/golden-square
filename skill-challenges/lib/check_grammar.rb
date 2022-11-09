def check_grammar(text)
  return true if text == ""
  return ".?!".include?(text.chars.last)
end