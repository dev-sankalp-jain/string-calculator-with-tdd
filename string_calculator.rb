# frozen_string_literal: true

class StringCalculator
  def add(string_of_numbers)
    if string_of_numbers.empty?
      return 0
    else
      string_of_numbers.to_i
    end
  end
end
