require_relative 'piece'

class Board
  
  def initialize(set_board = true)
    @grid = Array.new(8) { Array.new(8) { nil } }
    setup_board if set_board
  end
  
  def [](pos)
    i, j = pos
    @grid[i][j]
  end
  
  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end
  
  def display
    # numbering = (0..7)
    @grid.each_with_index do |row, idx1|
      puts 
      row.each do |piece, idx2|
        if piece == nil
          print " _ "
        elsif piece.color == :red
          print " R "  # will add Piece#render
        elsif piece.color == :black
          print " B " # will add Piece#render
        end
      end
    end 
    
    nil
  end
  
  def inspect
    self.display
  end
  
  def piece_count
    red_pawn, red_king, black_pawn, black_king  = 0, 0, 0, 0
    
    @grid.flatten.compact.each do |piece|
      if piece.color == :red && piece.promoted_piece == false
        red_pawn += 1
      elsif piece.color == :red && piece.promoted_piece == true
        red_king += 1
      elsif piece.color == :black && piece.promoted_piece == false
        black_pawn += 1
      else
        black_king += 1
      end
    end
    pieces = { red_pawn: red_pawn, red_king: red_king, 
               black_king: black_king, black_pawn: black_pawn }
  end
  
  def setup_board
    @grid.each_with_index do |row, row_i|
      row.count.times do |col_i|
        if (row_i == 0 || row_i == 2)  && col_i.odd?
          self[[row_i, col_i]] = Piece.new(:black, self, [row_i, col_i])
        end
        
        if row_i == 1 && col_i.even?
          self[[row_i, col_i]] = Piece.new(:black, self, [row_i, col_i])
        end
        
        if (row_i == 5 || row_i == 7) && col_i.even?
          self[[row_i, col_i]] = Piece.new(:red, self, [row_i, col_i])
        end
        
        if row_i == 6 && col_i.odd?
          self[[row_i, col_i]] = Piece.new(:red, self, [row_i, col_i])
        end
      end
    end
    
    nil
  end
  
  def dup
    board_dup = Board.new(false)
    @grid.flatten.compact.each do |checker|
      board_dup[checker.pos] = Piece.new(checker.color, board_dup, checker.pos)
    end
    
    board_dup
  end
end