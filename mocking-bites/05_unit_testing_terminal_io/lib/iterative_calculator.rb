class IterativeCalculator
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Hello. I will subtract two numbers."
    @io.puts "Please enter a number"
    num_1 = parse_input
    @io.puts "Please enter another number"
    num_2 = parse_input
    @io.puts "Here is your result:"
    @io.puts format_result(num_1, num_2)
  end

  private

  def parse_input
    input = @io.gets.chomp
    return input.to_i if input.match?(/[\+-]?[0-9]+/)
    fail "You must input a number"
  end

  def format_result(num_1, num_2)
    return "#{num_1} - #{num_2} = #{num_1 - num_2}"
  end
end

# iterative_calculator = IterativeCalculator.new(Kernel)
# iterative_calculator.run