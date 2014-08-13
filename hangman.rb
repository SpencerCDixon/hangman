#!/usr/bin/env ruby
require 'pry'
require 'pry-debugger'

# Create a word bank (array) that chooses a word at random.
# Player is shown the number of letters in the word but they remain masked until the letter is guessed correctly.
# Players have a limited number of guesses before losing.
# When the player guesses if right, reveal letter, if wrong, decrease number of chances by 1.
# If a player has already guessed a letter, the number of chances is not decremented

# User Stories

#As a gamemaster
#I want to choose a word at random
#So that the game isn't predictable

#As a player
#I want to know how much of the word I've guessed
#So that I know how much remains
#Make sure to display Chances Remaning: #ofchances

#As a gamemaster
#I want to prompt the user for input
#So that we can continue the game
CHANCES_REMAINING = 6
WORD_POOL = ["sky", "cat", "launch", "academy"]
PICKED_WORD = WORD_POOL.sample


binding.pry
def prompt
  print "What would you like to guess: "
  input = gets.chomp
end
