# frozen_string_literal: true

require './display'
require 'pry'

# class representing the case where the human is the guesser in Mastermind
class ComputerPlay
  include Display
  attr_reader :secret_code, :human_guesses
  attr_accessor :human_code

  def initialize
    @secret_code = random_code
    @human_guesses = []
    @human_code = nil
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
      @human_code = gets.chomp.chars.map(&:to_i)
      if valid_guess?
        add_human_guess
        return @human_code
      end

      puts "\nIncorrect combination, make sure the respect the conditions."
    end
  end

  def valid_guess?
    @human_code.all? { |digit| digit.between?(1, 6) } && @human_code.length == 4
  end

  def add_human_guess
    human_guesses << @human_code
  end

  def max_guesses?
    human_guesses.length == 12
  end

  def correct_guess?
    @human_code == secret_code
  end
end