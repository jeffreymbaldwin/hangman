require_relative 'Display'
require_relative 'InputHandler'
require_relative 'SecretMaker'


class Game

  def initialize 
    @input_handler = InputHandler.new
    @secret_maker = SecretMaker.new
    @secret_word = @secret_maker.secret_word
    p @secret_word
    p @input_handler.get_guess
  end

end