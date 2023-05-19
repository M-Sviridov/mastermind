# frozen_string_literal: true

require './display'

# module to include and print instructions of Mastermind before start of game
module Instructions
  include Display
  def instructions # rubocop:disable Metrics/AbcSize
    <<~TEXT

      Welcome to the Mastermind game!

      Here are the instructions:

      Each game of Mastermind consists of either guessing, or creating a 4 color
      combination code, choosing from 6 available:

      #{colors_code(1)}#{colors_code(2)}#{colors_code(3)}#{colors_code(4)}#{colors_code(5)}#{colors_code(6)}

      That is, the secret code can be any combination of those 6 colors, where duplicated
      are allowed, such an example is the following code:

      #{colors_code(3)}#{colors_code(1)}#{colors_code(4)}#{colors_code(4)}

      If you chose to be the guesser, then the computer will randomly generate a secret
      code, and you'll have a maximum of 12 turns to guess it. Otherwise, you lose.

      After every turn, you'll get some clues as to whether you had a correctly positioned
      digit, or a correct digit, but not in the right position.

      Clue associated with correct digit and correct position: #{clues_code(1)}
      Clue associated with correct digit and incorrect position: #{clues_code(2)}

      For example, if the secret code is#{' '}

      #{colors_code(3)}#{colors_code(1)}#{colors_code(4)}#{colors_code(4)}

      and you decide to guess#{' '}

      #{colors_code(3)}#{colors_code(5)}#{colors_code(1)}#{colors_code(4)}

      then the clues would be: #{clues_code(1)}#{clues_code(1)}#{clues_code(2)}

      If you chose to be the creator, then you'll be asked to create a 4-digit code
      using those 6 colors, each represented by a between 1 and 6. The computer will
      then try to guess your code, in 12 turns or less.

      All clear? So, do you want to be the guesser, or the creater?

      Press '1' to be the GUESSER
      Press '2' to be the CREATOR

    TEXT
  end
end
