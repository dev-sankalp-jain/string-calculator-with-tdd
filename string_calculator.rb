# frozen_string_literal: true

class StringCalculator
  def add(string_of_numbers)
    return 0 if string_of_numbers.empty?

    if string_of_numbers.start_with?('//')
      delimiter, string_of_numbers = string_of_numbers.split("\n", 2)
      delimiter = delimiter[2..]
      string_of_numbers.split(delimiter).reduce(0) { |sum, number| sum + number.to_i }
    else
      string_of_numbers.split(/[,\n]/).reduce(0) { |sum, number| sum + number.to_i }
    end
  end
end
