# frozen_string_literal: true

require 'rspec'
require_relative './string_calculator'

describe StringCalculator do
  subject(:calculator) { described_class.new }

  describe '#add' do
    context 'with vaild inputs' do
      it 'returns 0 for empty string' do
        expect(calculator.add('')).to eq(0)
      end

      it 'returns the same number if only one number is passed' do
        expect(calculator.add('1')).to eq(1)
      end

      it 'returns sum of numbers if two numbers are passed' do
        expect(calculator.add('1,2')).to eq(3)
      end

      it 'returns sum of numbers if two or more numbers are passed' do
        expect(calculator.add('1,2,3')).to eq(6)
      end
    end

    context 'with new line as a delimiter' do
      it 'returns sum of numbers' do
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'with custom delimiters' do
      it 'returns sum of numbers' do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end
    end
  end
end
