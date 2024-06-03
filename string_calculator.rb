# frozen_string_literal: true

class StringCalculator
  def add(string_of_numbers)
    return 0 if string_of_numbers.empty?

    string_of_numbers.split(',').reduce(0) { |sum, number| sum + number.to_i }
  end
end
