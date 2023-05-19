# frozen_string_literal: true

require './display'
require './colorable'

# class representing the case where the human is the guesser in Mastermind
class HumanPlay
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
    start
  end

  def start
    until max_guesses? || correct_guess?
      human_guess
      puts "\n"
      reveal_code(human_code)
      reveal_clues
      puts "\n"
    end

    if max_guesses?
      puts "\nYou lost! You used your 12 guesses."
      puts "The correct code was:\n\n"
      reveal_code(secret_code)
      puts ''
    elsif correct_guess?
      puts "\nCongratulations! You correctly guessed the secret code."
    end
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
