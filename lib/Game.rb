require_relative 'Display'
require_relative 'InputHandler'
require_relative 'SecretMaker'


class Game

  def initialize 
    @input_handler = InputHandler.new
    @secret_maker = SecretMaker.new
    @display = Display.new
    @secret_word = @secret_maker.secret_word
    @current_board = Array.new(@secret_word.length, "_")
    @history = []
    @current_lives = 6
  end

  def turn_loop
    @display.display_UI(@current_lives, @current_board, @history,)
    
    loop do 
      @current_guess = @input_handler.get_guess

      while @history.include?(@current_guess)
        puts "You already guessed that letter. Try again."
        @current_guess =@input_handler.get_guess
      end

      @history << @current_guess

      if @secret_word.include?(@current_guess)
        @secret_word.each_char.with_index do |char, index|
          if char == @current_guess
            @current_board[index] = @current_guess
          end
        end
      else @current_lives -= 1            
      end  

      @display.display_UI(@current_lives, @current_board, @history)

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

  def play
    turn_loop
  end

end
