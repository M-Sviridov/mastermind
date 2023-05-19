# frozen_string_literal: true

require './display'
require './colorable'
require './human_play'
require './instructions'

# class representing a full game of Mastermind when human is either creator/guessor
class Game
  include Instructions
  include Display

  def start
    puts instructions
    game_option
  end

  def game_option
    option = gets.chomp.to_i
    HumanPlay.new if option == 1
  end
end

Game.new.start
