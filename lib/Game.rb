require_relative 'Display'
require_relative 'InputHandler'
require_relative 'SecretMaker'


class Game

  def initialize 
    @input_handler = InputHandler.new
    @secret_maker = SecretMaker.new
    @secret_word = @secret_maker.secret_word
    p @secret_word
    @current_board = Array.new(@secret_word.length, "_")
  end
  def turn_loop
    #display the board so player knows word length  
    loop do 
      @input_handler.get_guess
      
      
    end
  end
end


#game loop
#
#get guess
#(after round 1) compare it to history and throw error if repeat call get guess again
#add the letter guess to the history array. 
#compare it to secret
#if it does not appear in secret -1 life
#if it does appear in secret do WHAT!?!?!!?!
#
#Toward the end of the loop if lives = 0 have display, game over. Break