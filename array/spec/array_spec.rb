require 'array'

describe 'Array#my_uniq' do
  let(:arr) { [3, 1, 2, 3, 1, 3, 3]}
  let(:arr2) { [1, 2, 1, 3, 3] }
  it 'returns an instance of an array' do
    expect(arr.my_uniq).to be_instance_of(Array)
  end
  
  it 'returns unique elements' do
    expect(arr.my_uniq).to eq([3, 1, 2])
  end
  
  it 'returns unique elements in order of appearance' do
    expect(arr2.my_uniq).to eq([1, 2, 3])
  end
end 

describe 'Array#two_sum' do
  let(:arr) { [-1, 0, 2, -2, 1] }
  
  it 'returns an instance of an array' do
    expect(arr.two_sum).to be_instance_of(Array)
  end
  
  it 'find all pairs of positions that sum to zero' do
    expect(arr.two_sum).to eq([[0, 4], [2, 3]])
  end
end 

describe 'Array#my_tranpose' do 
  let(:arr) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}
  
  let(:ans) {
    [[0, 3, 6],
     [1, 4, 7],
     [2, 5, 8]]
  }
  
  it 'returns an array' do
    expect( arr.my_transpose).to be_instance_of(Array)
  end
  
  it 'returns an array of arrays' do
    expect( arr.my_transpose[0]).to be_instance_of(Array)
  end

  it 'does not accept non-square arrays' do
    #expect to raise error if arrays not square
    array = [ [1,2,3], [1,2,3]]
    expect{array.my_transpose}.to raise_error(StandardError)
  end

  it 'returns a transposed array' do
    expect(arr.my_transpose).to eq(ans)
  end

end