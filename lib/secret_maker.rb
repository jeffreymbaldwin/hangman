class SecretMaker
  attr_reader :secret_word
  
  def initialize
    raw_word_list = File.readlines("words.txt")
    
    normalized_word_list = raw_word_list.map do |word|
        word.chomp
    end 
    word_bank = normalized_word_list.select do |word|
      word.length >= 6
    end
    @secret_word = word_bank.sample
  end

end
