# frozen_string_literal: true

require './display'
require 'pry'

# class representing the case where the human is the guesser in Mastermind
class ComputerPlay
  include Display
  attr_reader :secret_code, :human_code, :human_guesses

  def initialize
    @secret_code = random_code
    @human_guesses = []
    @human_code = human_guess
  end

  def random_code
    Array.new(4) { rand(1..6) }
  end

  def reveal_code(code)
    <<-CODE
    #{colors_code(code[0])}#{colors_code(code[1])}#{colors_code(code[2])}#{colors_code(code[3])}
    CODE
  end

  def human_guess
    loop do
      print 'Enter your combination of 4 digits (between 1 and 6): '
      code = gets.chomp.chars.map(&:to_i)
      if valid_guess?(code)
        add_human_guess(code)
        return code
      end

      puts "\nIncorrect combination, make sure the respect the conditions."
    end
  end

  def valid_guess?(code)
    code.all? { |digit| digit.between?(1, 6) } && code.length == 4
  end

  def add_human_guess(code)
    human_guesses << code
  end

  def max_guesses?
    human_guesses.length == 12
  end
end

comp = ComputerPlay.new
binding.pry
# comp.human_guess
