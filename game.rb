# frozen_string_literal: true

require './display'
require './colorable'
require './computer_play'
require './instructions'

class Game
  include Instructions
  include Display

  def start
    puts instructions
    puts game_option
  end

  def game_option
    option = gets.chomp.to_i
    ComputerPlay.new if option == 1
  end
end

Game.new.start