require_relative 'display'
require_relative 'input_handler'
require_relative 'secret_maker'
require_relative 'save_manager'


class Game

  def initialize
    @input_handler = InputHandler.new
    @display = Display.new
    @save_manager = SaveManager.new
  end

  def play
    puts "To start a new game, type N. To load the previous save type L."
    puts "**WARNING** A save file is deleted once it has been sucessfully loaded."
    puts "Be sure to save the game again before quitting."
    input = gets.chomp.downcase
    until ["l", "n"].include?(input)
    puts "Invalid input."
    puts "To start a new game, type N. To load the previous save type L."
    puts "**WARNING** A save file is deleted once it has been sucessfully loaded."
    puts "Be sure to save the game again before quitting a loaded game."
    input = gets.chomp.downcase
    end
    if input == "n"
      setup_new_game
      turn_loop
    elsif input == "l"
      if @save_manager.save_exists?
        setup_loaded_game
        turn_loop
      else
        puts "No save found"
        puts "Would you like to start a new game? Yes or no?"
        input = gets.chomp.downcase
        until ["yes", "no"].include?(input)
          puts "Invalid input."
          puts "No save found"
          puts "Would you like to start a new game? Yes or no?"
          input = gets.chomp.downcase
        end
        if input == "yes"
          setup_new_game
          turn_loop
        elsif input == "no"
          puts "Fair enough. Have a nice day. Closing the program."
        end
      end
    end
  end

  def setup_new_game
    secret_maker = SecretMaker.new
    @secret_word = secret_maker.secret_word
    @current_board = Array.new(@secret_word.length, "_")
    @history = []
    @current_lives = 6
  end

  def setup_loaded_game
    data = @save_manager.load
    @secret_word = data[:secret_word]
    @current_board = data[:current_board]
    @history = data[:history]
    @current_lives = data[:current_lives]
    puts "Save File Loaded"
    @save_manager.delete_save
    puts "Save files can only be loaded once, so the data has been deleted."
  end



  def turn_loop
    @display.display_ui(@current_lives, @current_board, @history)

    loop do 
      @current_guess = @input_handler.get_guess
      break if save_check(@current_guess)

      while @history.include?(@current_guess)
        puts "You already guessed that letter. Try again."
        @current_guess = @input_handler.get_guess
        return if save_check(@current_guess)
      end

      @history << @current_guess

      if @secret_word.include?(@current_guess)
        @secret_word.each_char.with_index do |char, index|
          if char == @current_guess
            @current_board[index] = @current_guess
          end
        end
      else 
        @current_lives -= 1            
      end  

      @display.display_ui(@current_lives, @current_board, @history)

      if @current_lives == 0 
        @display.lose_message
        break
      end

      if @current_board.join == @secret_word
        @display.win_message
        break
      end
    end  
  end

  def game_state
    {
      secret_word: @secret_word,
      current_board: @current_board,
      history: @history,
      current_lives: @current_lives
    }
  end

  def save_game
    @save_manager.save(game_state)
    puts "Game saved."
  end

  def save_check(guess)
   if guess == :save
     save_game
     true
   else
    false
   end
  end

end
