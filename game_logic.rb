# frozen_string_literal: true

require_relative 'human_play'

# module representing the game logic for computer play and human play
module GameLogic
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

  def max_guesses?(guesses)
    guesses.length == 12
  end

  def correct_guess?(guess)
    guess == secret_code
  end
end