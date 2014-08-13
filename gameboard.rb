#!/usr/bin/env ruby
require 'pry'
require 'pp'


WORD_POOL = ["sky","cat", "launch", "academy", "bopped", "jibbed", "zapped", "jinxed", "fluffing", "jazz", "buzz", "jays", "jars", "jeez","joking"]
PICKED_WORD = WORD_POOL.sample


class Gameboard
  attr_accessor :picked_word, :default_tile, :tiles, :gameboard,            :number_of_chances, :wrong_guesses

  def initialize(picked_word, chances_remaining)
    @picked_word = picked_word
    @default_tile = '_'
    @tiles = picked_word.split(//)
    @gameboard = tiles.map {|letter| letter = default_tile}
    @number_of_chances = chances_remaining
    @wrong_guesses = []
  end

  def show_board
    puts
    pp gameboard
    puts chances_remaining
    puts "Wrong Guesses:"
    pp wrong_guesses
    puts
  end

  def prompt
    print "What would you like to guess: "
    input = gets.chomp
    check_guess(input)
  end

  def chances_remaining
    "Number Of Chances: #{@number_of_chances}"
  end

  def check_guess(input)

    if input == picked_word
      puts # checks for if they guess whole word
      puts "You win the game!"
      exit
    end

    if tiles.include?(input) #checks to see if word includes letter
      index_to_change = tiles.index(input)
      gameboard[index_to_change] = input
      puts "Nice! Great guess"
        if tiles == gameboard
          puts "You win the game!"
        end
    else
      if wrong_guesses.include?(input)
        puts "You already guessed that silly! Try again please."
      else
        puts "You guessed wrong."
        @number_of_chances -= 1
          if @number_of_chances == 0
            puts "Oh no! You ran out of chances :("
            puts "Game Over. Play Again?"
            exit
          end
        wrong_guesses << input
      end
    end
  end

end

gameboard = Gameboard.new(PICKED_WORD, 6)
until gameboard.tiles == gameboard.gameboard
gameboard.show_board
gameboard.prompt
end
