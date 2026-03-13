class InputHandler
  
  def get_guess

    puts "Enter your 1 letter guess. Type SAVE to save the game."
    guess = gets.chomp.downcase

    until guess.match?(/\A[a-z]{1}\z/) || guess == "save"
      puts "Invalid input. Be sure to only enter 1 alphabet character."
      guess = gets.chomp.downcase
    end
    
    if guess == "save"
      return :save
    end

  guess
  end
end
