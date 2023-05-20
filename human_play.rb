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
    @secret_code = random_code
    @human_guesses = []
    @human_code = nil
    start
  end

  def start
    until max_guesses?(human_guesses) || correct_guess?(human_code)
      human_guess
      compare_codes(secret_code, human_code)
      one_turn_text(human_code)
    end

    if max_guesses?(human_guesses)
      human_lose_text
    elsif correct_guess?(human_code)
      human_win_text
    end
  end

  def human_guess
    loop do
      print "\nTurn ##{@total_turns}, enter 4 digits (between 1 and 6): "
      @human_code = gets.chomp.chars.map(&:to_i)
      if valid_guess?(@human_code)
        add_guess
        @total_turns += 1
        return @human_code
      end

      puts "\nIncorrect combination, make sure the respect the conditions.".fg_color(:aurora1)
    end
  end

  def add_guess
    human_guesses << human_code
  end
end
