# StringCalculator

The `StringCalculator` class provides a method to add numbers from a string input. It supports custom delimiters and raises an error if negative numbers are included.

## Features

- Adds numbers provided in a string format.
- Supports custom delimiters.
- Raises an error if negative numbers are included.

## Usage

### Basic Usage

To use the `StringCalculator`, first require the class and create an instance of it:

```ruby
require_relative 'string_calculator'

calculator = StringCalculator.new
```

### Adding Numbers

You can add numbers by passing a string of numbers separated by commas or newlines:

```ruby
result = calculator.add("1,2,3") # returns 6
result = calculator.add("1\n2,3") # returns 6
```

### Custom Delimiters

To use a custom delimiter, prefix the string with `//` followed by the delimiter and a newline:

```ruby
result = calculator.add("//;\n1;2;3") # returns 6
result = calculator.add("//|\n1|2|3") # returns 6
```

### Handling Negative Numbers

If the string contains negative numbers, a `NegativeNumberError` is raised:

```ruby
begin
  calculator.add("1,-2,3")
rescue StringCalculator::NegativeNumberError => e
  puts e.message # outputs: "negative numbers not allowed: -2"
end
```
