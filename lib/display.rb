class Display
  BOARD_WIDTH = 33
  INNER_WIDTH = BOARD_WIDTH - 2

  HANGMAN_STATES = [
    # Lives = 0 (full body)
    [
      "  _______",
      " |/      |",
      " |       O",
      " |      /|\\",
      " |      / \\",
      " |"
    ],

    # Lives = 1 (right leg)
    [
      "  _______",
      " |/      |",
      " |       O",
      " |      /|\\",
      " |        \\",
      " |"
    ],

    # Lives = 2 (both arms)
    [
      "  _______",
      " |/      |",
      " |       O",
      " |      /|\\",
      " |",
      " |"
    ],

    # Lives = 3 (right arm)
    [
      "  _______",
      " |/      |",
      " |       O",
      " |       |\\",
      " |",
      " |"
    ],

    # Lives = 4 (body)
    [
      "  _______",
      " |/      |",
      " |       O",
      " |       |",
      " |",
      " |"
    ],

    # Lives = 5 (head)
    [
      "  _______",
      " |/      |",
      " |       O",
      " |",
      " |",
      " |"
    ],

    # Lives = 6 (empty start)
    [
      "  _______",
      " |/      |",
      " |",
      " |",
      " |",
      " |"
    ]
  ].freeze

  
  def display_lives(lives)
    puts "Lives: #{lives}".center(BOARD_WIDTH)
  end

  def display_hangman(lives)
    puts "-" * BOARD_WIDTH
    HANGMAN_STATES[lives].each do |line|
      puts "|#{line.ljust(INNER_WIDTH)}|"
    end
    puts "-" * BOARD_WIDTH
  end

  def display_current_board (current_board)
    puts current_board.join(" ")
    puts
  end

  def display_history(history)
    puts "**GUESSES**"
    puts history.join(" ")
  end

  def display_ui(lives, current_board, history)

    display_lives(lives)
    display_hangman(lives)
    display_current_board (current_board)
    display_history (history) 

  end

  def win_message
    puts "*****Congrats! You win!*****"
  end

  def lose_message
    puts "*****Oh no!*****
You died. Too bad. :(
Better luck next time!"
  end
end
