class Array
  def my_uniq
    result = []
    self.each do |el|
      result << el unless result.include?(el)
    end
  
    result
  end
  
  def two_sum
    result = []
    (0...self.size).each do |i|
      (i + 1...self.size).each do |j|
        if self[i] + self[j] == 0
          result << [i, j]
        end
      end
    end
    result
  end
  
  def my_transpose
    size = self[0].count
    result = Array.new(size) { Array.new(size) } 
    if self[0].count != self.count
      raise StandardError.new "Matrix is not square"
    end
    (0...self.size).each do |i|
      (0...self.size).each do |j|
        result[i][j] = self[j][i]
      end
    end
    result
  end
  
  
  
end