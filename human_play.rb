# frozen_string_literal: true

require './display'
require './colorable'
require './game_logic'

# class representing the case where the human is the guesser in Mastermind
class HumanPlay
  attr_reader :secret_code, :human_guesses, :total_turns, :human_code

  include Display
  include GameLogic
  using Colorable

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
    until max_guesses?(human_guesses) || correct_guess?(human_code)
      human_guess
      one_turn_text
    end

    if max_guesses?(human_guesses)
      human_lose_text
    elsif correct_guess?(human_code)
      human_win_text
    end
  end

  def random_code
    Array.new(4) { rand(1..6) }
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

  def add_human_guess
    human_guesses << human_code
  end
end
