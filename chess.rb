# encoding: utf-8


require_relative "board"
require 'debugger'

class Game
  attr_accessor :current_board
  
  def initialize
    @current_board = Board.new(true)
  end
  
  def play
    until game_over?
      system('clear')
      @current_board.display
      begin                
        puts "Enter an origin position: "
        origin = gets.chomp.split(', ').map { |i| i.to_i }
        puts "Enter the destination position: "
        destination = gets.chomp.split(', ').map { |i| i.to_i }  
        @current_board.move_piece(origin, destination)
      rescue IllegalMoveError => e
        puts "Could not perform move."
        puts "Error was #{e.message}"
        retry
      end
    end    
  end
  
  def update
  end
  
  def game_over?
    false
  end
end

game = Game.new
game.play



