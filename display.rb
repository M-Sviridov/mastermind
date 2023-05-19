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

  def reveal_code(code)
    code.each do |digit|
      print colors_code digit
    end
  end

  def reveal_clues
    exact_matches.times do
      print clues_code 1
    end

    correct_numbers.times do
      print clues_code 2
    end
  end

  def one_turn_text
    puts "\n"
    reveal_code(human_code)
    reveal_clues
    puts "\n"
  end

  def human_win_text
    puts "\n"
    puts 'Congratulations! You correctly guessed the secret code.'
  end

  def human_lose_text
    puts "\n"
    puts 'You lost! You used your 12 guesses.'
    puts 'The correct code was:'
    puts "\n"
    reveal_code(secret_code)
    puts ''
  end
end
