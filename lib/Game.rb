require_relative 'Display'
require_relative 'InputHandler'
require_relative 'SecretMaker'


class Game

  def initialize 
    @secret_maker = SecretMaker.new
  end

end