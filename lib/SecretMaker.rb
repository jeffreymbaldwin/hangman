class SecretMaker
  
  def initialize
    word_list = File.readlines("words.txt")
    p word_list
    # word_list.each do |word|
    #   word.chomp
      
    
  end


end


# Correct mental pipeline (no code)

# You need:

# Read file as lines → get array

# Transform each line → remove newline

# Store the cleaned result somewhere

# Then filter

# Right now you’re at:

# Step 1 is incorrect (you’re getting one big string)

# Step 2 isn’t storing the cleaned result