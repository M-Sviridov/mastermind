# frozen_string_literal: true

require './computer_play'
require './display'

comp = ComputerPlay.new
secret_code = comp.secret_code

until comp.max_guesses? || comp.correct_guess?
  comp.human_guess
  comp.human_guesses.each do |guess|
    puts "\n"
    comp.reveal_code(guess)
    puts "\n"
  end
end

if comp.max_guesses?
  puts 'You lost! You used your 12 guesses.'
elsif comp.correct_guess?
  puts 'You won, you guessed the code: '
  comp.reveal_code(secret_code)
  puts "\nCongratulations!"
end
