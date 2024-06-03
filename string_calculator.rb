# frozen_string_literal: true

class StringCalculator
  def add(string_of_numbers)
    return 0 if string_of_numbers.empty?

    numbers = string_of_numbers.split(',')

    return string_of_numbers.to_i if numbers.size == 1

    sum = 0
    numbers.each do |number|
      sum += number.to_i
    end

    sum
  end
end
