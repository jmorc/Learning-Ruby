require_relative 'board'

class Game
  
  def initialize
    @board = Board.new
    @turn = "red's"
  end
  
  def start
    until over? 
      @board.display
      puts
      move_sequence = get_keyboard_moves
      turn_check
      @board[move_sequence[0]].perform_moves(move_sequence) 
      turn_switch
    end
  end
  
  def turn_switch
    @turn = @turn == "red's" ? "black's" : "red's"
  end
  
  def turn_check
    # need to implement a 
  end
  
  def get_keyboard_moves
    move_sequence = []
    pieces = @board.piece_count
    puts "Red has #{pieces[:red_pawn]} pawns and #{pieces[:red_king]} kings"
    puts "Black has #{pieces[:black_pawn]} pawns and #{pieces[:black_king]} kings"
    puts "It is #{@turn} turn to play.  Enter a starting row and col: "
    row, col = gets.chomp.split(',').map { |x| x.to_i }
    start_pos = [row, col]
    move_sequence << start_pos
    loop do
      puts "Enter the destination (or next destination)." 
      puts "Just press <enter> if all destinations are entered."
      input = gets.chomp
      break if input.empty?
      row, col = input.split(',').map { |x| x.to_i }
      move_sequence << [row, col]
    end
    move_sequence = move_sequence.compact
  end
  
  def over?
    game_over = false
    pieces = @board.piece_count
    game_over = true if pieces[:red_king] == 0 && pieces[:red_pawn] == 0
    game_over = true if pieces[:black_king] == 0 && pieces[:black_pawn] == 0
    
    game_over
  end

end