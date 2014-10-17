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
