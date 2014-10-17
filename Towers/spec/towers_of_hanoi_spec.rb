require 'towers_of_hanoi'

describe "Towers of Hanoi"  do
  let(:game) { TowersOfHanoi.new }
  let(:source) { 0 }
  let(:target) { 1 }
  
  
  
  it  "renders an array" do
    expect(game.render).to be_instance_of(Array)
  end
  
  it "has 5 disks in first array" do
    expect(game.towers[0].size).to eq(5)
  end
  
  it "moves a disk from a source to a target" do
    game.move(source,target)
    expect(game.towers).to eq([ (2..5).to_a, [1], [] ])
  end
  
  it 'cannot move a large disk on top of a small disk' do
    game.move(0, 1)
    expect(game.move(0, 1)).to raise_error(StandardError)
    
  end
    
end