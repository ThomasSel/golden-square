class GrammarStats
  def initialize
    @successes = []
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    fail "ERROR - Input cannot be nil" if text.nil?
    return true if text == ""

    is_capitalized = text.chars.first == text.chars.first.upcase
    is_punctuated = ".?!".include?(text.chars.last)
    @successes << (is_capitalized && is_punctuated)
    return is_capitalized && is_punctuated
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
    return 100 if @successes == []
    (@successes.map { |b| b ? 1 : 0 }.sum * 100 / @successes.count.to_f).floor
  end
end