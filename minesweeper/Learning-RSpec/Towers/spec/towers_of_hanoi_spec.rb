require 'towers_of_hanoi'
require 'debugger'
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
  
  it 'cannot move from an empty tower' do
    #expect an error if source is empty
    expect{game.move(1,0)}.to raise_error
  end
  
  it 'cannot move a large disk on top of a small disk' do
    #expect an error if source disk is bigger than target disk
    game.move(0, 1)
    expect{game.move(0, 1)}.to raise_error
  end
  
  it 'detects a win state' do
    game.towers[1] = (1..5).to_a
    expect(game.won?).to eq(true)
  end
    
end