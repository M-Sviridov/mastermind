# frozen_string_literal: true

require './display'
require './colorable'

# class representing the case where the human is the guesser in Mastermind
class ComputerPlay
  include Display
  using Colorable
  attr_reader :secret_code, :human_guesses, :total_turns, :human_code

  def initialize
    @total_turns = 1
    @secret_code = [5, 5, 1, 5]
    @human_guesses = []
    @human_code = nil
    @human_code_copy = []
    @secret_code_copy = []
  end

  def random_code
    Array.new(4) { rand(1..6) }
  end

  def reveal_code(code)
    code.each do |digit|
      print colors_code digit
    end
  end

  def human_guess
    loop do
      print "\nTurn ##{@total_turns}, enter 4 digits (between 1 and 6): "
      @human_code = gets.chomp.chars.map(&:to_i)
      if valid_guess?
        add_human_guess
        @total_turns += 1
        return @human_code
      end

      puts "\nIncorrect combination, make sure the respect the conditions.".fg_color(:aurora1)
    end
  end

  def valid_guess?
    human_code.all? { |digit| digit.between?(1, 6) } && human_code.length == 4
  end

  def exact_matches
    @secret_code_copy = secret_code.clone
    @human_code_copy = human_code.clone
    correct = 0

    @human_code_copy.each_with_index do |digit, index|
      next unless digit == secret_code[index]

      @secret_code_copy[index] = nil
      @human_code_copy[index] = nil
      correct += 1
    end
    correct
  end

  def correct_numbers
    incorrect = 0

    @human_code_copy.each_with_index do |digit, index|
      next unless @secret_code_copy.include?(digit) && !digit.nil?

      @secret_code_copy[@secret_code_copy.index(digit)] = nil
      @human_code_copy[index] = nil
      incorrect += 1
    end
    incorrect
  end

  def reveal_clues
    exact_matches.times do
      print clues_code 1
    end

    correct_numbers.times do
      print clues_code 2
    end
  end

  def add_human_guess
    human_guesses << human_code
  end

  def max_guesses?
    human_guesses.length == 12
  end

  def correct_guess?
    human_code == secret_code
  end
end
