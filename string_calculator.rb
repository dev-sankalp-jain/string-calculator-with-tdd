# frozen_string_literal: true

class StringCalculator
  def add(string_of_numbers)
    return 0 if string_of_numbers.empty?

    numbers = string_of_numbers.split(',')

    if numbers.size == 1
      return string_of_numbers.to_i
    else  
    numbers[0].to_i + numbers[1].to_i
    end
  end
end
