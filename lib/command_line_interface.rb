def welcome
  puts "Welcome to Star Wars API Hash!"
end

def get_character_from_user
  # use gets to capture the user's input. This method should return that input, downcased.
  puts "Please enter a character: (Quit to Leave)"
  user_input = gets.chomp.downcase
  if user_input != "quit"
    user_input
  else
    exit
  end
  # if user_input == "quit"
  #   break
  # else
  #   user_input
  # end
end
