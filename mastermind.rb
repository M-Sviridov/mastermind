# frozen_string_literal: true

require './computer_play'
require './display'

comp = ComputerPlay.new
secret_code = comp.secret_code

until comp.max_guesses? || comp.correct_guess?
  comp.human_guess
  puts "\n"
  comp.reveal_code(comp.human_code)
  comp.reveal_clues
  puts "\n"
end

if comp.max_guesses?
  puts '\nYou lost! You used your 12 guesses.'
  puts 'The correct code was: '
  comp.reveal_code(secret_code)
elsif comp.correct_guess?
  puts "\nCongratulations! You correctly guessed the secret code."
end
