# frozen_string_literal: true

require './display'
require './colorable'
require './human_play'
require './computer_play'
require './instructions'

# class representing a full game of Mastermind when human is either creator/guessor
class Game
  include Instructions
  include Display
  using Colorable

  def initialize
    @option = nil
  end

  def start
    puts instructions
    game_option
    launch_game
  end

  def game_option
    loop do
      @option = gets.chomp.to_i
      return @option if @option == 1 || @option == 2

      puts "\nPlease enter either 1 or 2.".fg_color(:aurora1)
    end
  end

  def launch_game
    HumanPlay.new if @option == 1
    ComputerPlay.new if @option == 2
  end
end
