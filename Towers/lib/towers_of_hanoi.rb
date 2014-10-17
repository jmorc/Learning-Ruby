class TowersOfHanoi
  
  attr_reader :towers

  def initialize
    @towers = [(1..5).to_a,[],[]]
  end
  
  def render
    @towers
  end
  
  def move(source,target)
    if !@towers[target].first.nil?  && @towers[source].first > @towers[target].first 
      raise StandardError.new("Cannot move disk")
    end
    
    @towers[target] << @towers[source].shift
  end
end