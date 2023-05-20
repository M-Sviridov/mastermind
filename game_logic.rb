# frozen_string_literal: true

require_relative 'human_play'

# module representing the game logic for computer play and human play
module GameLogic
  def compare_codes(master, guess)
    master_copy = master.clone
    guess_copy = guess.clone
    @exact_total = exact_matches(master_copy, guess_copy)
    @correct_total = correct_numbers(master_copy, guess_copy)
    # [@exact_total, @correct_total]
  end

  def exact_matches(master, guess)
    correct = 0

    guess.each_with_index do |digit, index|
      next unless digit == master[index]

      master[index] = nil
      guess[index] = nil
      correct += 1
    end
    correct
  end

  def correct_numbers(master, guess)
    incorrect = 0

    guess.each_with_index do |digit, index|
      next unless master.include?(digit) && !digit.nil?

      master[master.index(digit)] = nil
      guess[index] = nil
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