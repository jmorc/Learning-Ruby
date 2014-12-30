# require 'debugger'

class TowersOfHanoi
  
  attr_reader :towers

  def initialize
    @towers = [(1..5).to_a,[],[]]
  end
  
  def render
    @towers
  end
  
  def move(source,target)
    if @towers[source].empty?
      raise StandardError.new #("Source is nil")
    end

    if !@towers[target].first.nil?
      # debugger
      if @towers[source].first > @towers[target].first
        raise StandardError.new("Source is larger")
      end
    end
    
    @towers[target] << @towers[source].shift
  end
  
  def won?
    if towers[1].size == 5
      return true
    end
    false
  end
end

# game = TowersOfHanoi.new
# p game.towers
# game.move(0,1)
# p game.towers
# game.move(0,1)