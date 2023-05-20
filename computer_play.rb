# frozen_string_literal: true

require './display'
require './colorable'
require './game_logic'
require 'pry'

# class representing the case where the human is the creator in Mastermind
class ComputerPlay
  attr_reader :potential_codes, :computer_guess

  include Display
  include GameLogic
  using Colorable

  def initialize
    @computer_guess = [1, 1, 2, 2]
    @digits = [1, 2, 3, 4, 5, 6]
    @potential_codes = all_codes
    @secret_code = ask_human
    @computer_guesses = []
    start
  end

  def start
    @total_turns = 1
    until max_guesses?(@computer_guesses) || correct_guess?(@computer_guess)
      print "\nTurn ##{@total_turns}, computer chose:\n"
      new_guess
    end

    return unless correct_guess?(@secret_code)

    computer_win_text
  end

  def all_codes
    result = []

    @digits.repeated_permutation(4) do |perm|
      result << perm
    end
    result
  end

  def ask_human
    loop do
      print "\nEnter 4 digits (between 1 and 6): "
      @secret_code = gets.chomp.chars.map(&:to_i)
      return @secret_code if valid_guess?(@secret_code)

      puts "\nIncorrect combination, make sure the respect the conditions.".fg_color(:aurora1)
    end
  end

  def new_guess
    compare_codes(@secret_code, @computer_guess)
    one_turn_text(@computer_guess)
    reduce_potential_codes
    sleep 1.5
    @computer_guess = @potential_codes[0]
    @potential_codes.delete(@computer_guess)
    @total_turns += 1
    @computer_guess
  end

  def reduce_potential_codes
    temp_array = []
    @potential_codes.each do |code|
      temp_array << code if compare_codes(@secret_code, @computer_guess) == compare_codes(@computer_guess, code)
    end
    @potential_codes = temp_array
  end
end
