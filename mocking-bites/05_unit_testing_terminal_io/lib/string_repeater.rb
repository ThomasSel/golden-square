class StringRepeater
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Hello. I will repeat a string many times."
    @io.puts "Please enter a string"
    string = @io.gets.chomp
    @io.puts "Please enter a number of repeats"
    number_of_repeats = parse_number_input
    @io.puts "Here is your result:"
    @io.puts string * number_of_repeats
  end

  private

  def parse_number_input
    input = @io.gets.chomp
    fail "The number of repetitions must be a number" unless input.match?(/[\+\-]?[0-9]+/)
    number = input.to_i
    fail "The number of repetitions must be positive" if number < 0
    return number
  end
end

# string_repeater = StringRepeater.new(Kernel)
# string_repeater.run