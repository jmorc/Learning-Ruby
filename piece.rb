require_relative 'invalid_move_error'

class Piece
  
  UP_DIFFS = [[-1, 1], [-1, -1]]
  DOWN_DIFFS = [[1, 1], [1, -1]]
  ALL_DIFFS = UP_DIFFS + DOWN_DIFFS
  
  attr_reader :move_diffs, :color, :promoted_piece, :pos
  
  def initialize(color, board, pos)
    @promoted_piece = false
    @color = color
    @pos = pos
    @board = board
  end
  
  def perform_jump(start_pos, end_pos)
    return false unless valid_move?(start_pos, end_pos)
    requested_diff = calc_move_diff(start_pos, end_pos)
    jump_diffs = move_diffs.map do |arr|
      arr.map { |i| i * 2}
    end
    
    raise InvalidMoveError.new("You cannot jump that way") unless 
          jump_diffs.include?(requested_diff)
  
    victim_space  = [start_pos[0] + requested_diff[0] / 2,
                     start_pos[1] + requested_diff[1] / 2]    
    
    valid_victim?(victim_space)
    dispense_victim(victim_space)
    make_move(start_pos, end_pos)
    
    true
  end
  
  def perform_moves(move_sequence)
    if valid_move_seq?(move_sequence)
      self.perform_moves!(move_sequence)
    else
      raise InvalidMoveError.new("Error in perform_moves")
    end
  end
    
  def perform_moves!(move_sequence)
    if move_sequence.count == 2
      begin
        it_slid = perform_slide(move_sequence[0], move_sequence[1])
      rescue
        it_jumped = perform_jump(move_sequence[0], move_sequence[1])
      end
    elsif move_sequence.count > 2
      move_sequence.each_with_index do |position, idx|
        next if idx > move_sequence.count - 2
        perform_jump(position, move_sequence[idx + 1])
      end
    end
            
  end
  
  def valid_move_seq?(move_sequence)
    
    dupped_board = @board.dup
    begin
      dupped_board[@pos].perform_moves!(move_sequence)
    rescue InvalidMoveError => e
      puts "Error raised to valid_move_seq?"
      puts "Error was: #{e.message}"
      false
    else
      true
    end
  end
  
  def perform_slide(start_pos, end_pos)
    return false unless valid_move?(start_pos, end_pos)
    requested_diff = calc_move_diff(start_pos, end_pos)
    
    unless move_diffs.include?(requested_diff) 
      raise InvalidMoveError.new("Illegal move!! You could never move that way!!")
    end
   
    make_move(start_pos, end_pos)
    true
  end
  
  private
  
  def dispense_victim(victim_space)
    @board[victim_space] = nil
    nil
  end
   
  def valid_victim?(victim_space)
    victim = @board[victim_space]
    if victim.nil? || victim.color == @color
      raise InvalidMoveError.new("Illegal jump.  That space was empty or you attacked a comrade.")
    end 
    
    true
  end
  
  def valid_move?(start_pos, end_pos)
    validity = false
    
    if @board[start_pos].nil?
      raise InvalidMoveError.new("There is no piece in the requested start position")
    elsif !(end_pos[0].between?(0, 7) && end_pos[1].between?(0, 7))
      raise InvalidMoveError.new("End position is off the board.")
    elsif !(start_pos[0].between?(0, 7) && start_pos[1].between?(0, 7))
      raise InvalidMoveError.new("Start position is off the board.")
    elsif !@board[end_pos].nil?
      raise InvalidMoveError.new("You cannot move there.  Someone's already there.  Tool.")
    else
      validity = true
    end
    
    validity
  end
    
  def calc_move_diff(start_pos, end_pos)
    row_diff = end_pos[0] - start_pos[0]
    col_diff = end_pos[1] - start_pos[1]
    diff = [row_diff, col_diff]
  end
    
  def make_move(start_pos, end_pos)
    @board[end_pos] = self
    @pos = end_pos 
    @board[start_pos] = nil
    maybe_promote
  end
    
  def move_diffs
    if @promoted_piece == true
      return ALL_DIFFS
    elsif @color == :red
      return UP_DIFFS
    else
      return DOWN_DIFFS
    end
  end
  
  def maybe_promote
    if @color == :red && @pos[0] == 0
      @promoted_piece = true
    elsif @color == :black && @pos[0] == 7
      @promoted_piece = true
    end
    
    nil
  end
  
end
