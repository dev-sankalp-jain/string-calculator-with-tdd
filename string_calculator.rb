# frozen_string_literal: true

class StringCalculator
  class NegativeNumberError < StandardError
    def initialize(numbers)
      super("negative numbers not allowed: #{numbers.join(', ')}")
    end
  end

  def add(string_of_numbers)
    return 0 if string_of_numbers.empty?

    delimiter, numbers = extract_delimiter_and_numbers(string_of_numbers)
    numbers = numbers.split(delimiter)

    negative_numbers = numbers.select { |number| number.to_i.negative? }
    raise NegativeNumberError, negative_numbers if negative_numbers.any?

    numbers.reduce(0) { |sum, number| sum + number.to_i }
  end

  private

  def extract_delimiter_and_numbers(string_of_numbers)
    if string_of_numbers.start_with?('//')
      parts = string_of_numbers.split("\n", 2)
      [Regexp.new(Regexp.escape(parts[0][2..])), parts[1]]
    else
      [/[,\n]/, string_of_numbers]
    end
  end
end
