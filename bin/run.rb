#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
input = ""
flag = true
while (flag)
  character = get_character_from_user
  if character == "quit"
    flag=false
  else
    show_character_movies(character)
  end
end
