# frozen_string_literal: true

# module that displays certain information for the game
module Display
  def colors_code(number)
    {
      1 => "\e[41m  1  \e[0m ",
      2 => "\e[42m  2  \e[0m ",
      3 => "\e[43m  3  \e[0m ",
      4 => "\e[44m  4  \e[0m ",
      5 => "\e[45m  5  \e[0m ",
      6 => "\e[46m  6  \e[0m "
    }[number]
  end

  def clues_code(number)
    {
      1 => "\e[91m\u25CF\e[0m ",
      2 => "\e[37m\u25CB\e[0m "
    }[number]
  end
end
