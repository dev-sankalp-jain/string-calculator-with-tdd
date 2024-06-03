# frozen_string_literal: true

class StringCalculator
  class NegativeNumberError < StandardError
    def initialize(numbers)
      super("negative numbers not allowed: #{numbers.join(', ')}")
    end
  end

  DEFAULT_DELIMITER = /[,\n]/

  def add(string_of_numbers)
    return 0 if string_of_numbers.empty?

    numbers = extract_numbers(string_of_numbers)
    validate_negative_numbers(numbers)
    sum_numbers(numbers)
  end

  private

  def extract_numbers(string_of_numbers)
    delimiter, numbers = determine_delimiter_and_numbers(string_of_numbers)
    numbers.split(delimiter)
  end

  def determine_delimiter_and_numbers(string_of_numbers)
    if string_of_numbers.start_with?('//')
      parts = string_of_numbers.split("\n", 2)
      delimiter = Regexp.new(Regexp.escape(parts[0][2..]))
      [delimiter, parts[1]]
    else
      [DEFAULT_DELIMITER, string_of_numbers]
    end
  end

  def validate_negative_numbers(numbers)
    negative_numbers = numbers.select { |number| number.to_i.negative? }
    raise NegativeNumberError, negative_numbers if negative_numbers.any?
  end

  def sum_numbers(numbers)
    numbers.map(&:to_i).sum
  end
end
