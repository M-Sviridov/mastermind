require './computer_play'
require './display'

comp = ComputerPlay.new
puts comp.reveal_code(comp.secret_code)

comp.human_guess until comp.max_guesses? || comp.correct_guess?

if comp.max_guesses?
  puts 'You lost! You used your 12 guesses.'
elsif comp.correct_guess?
  puts "You won, you guessed the code #{comp.reveal_code(comp.secret_code)}"
end
