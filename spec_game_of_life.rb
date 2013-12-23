#spec file

require 'rspec'

Dir.glob('./lib/*.rb') do |model|
  require_relative model
end

describe 'World' do
  subject { World.new }
  
  it 'should create a new world subject' do
    subject.is_a?(World).should be_true
  end

  it 'should respond to proper methods' do 
    subject.should respond_to(:rows)
    subject.should respond_to(:cols)
    subject.should respond_to(:cell_grid)
  end

  it 'should create proper cell grid upon initialization' do
    subject.cell_grid.is_a?(Array).should be_true
    subject.cell_grid.each do |row| 
      row.is_a?(Array).should be_true
      row.each do |col| 
        col.is_a?(Cell).should be_true
      end
    end
  end

end

describe 'Cell' do
  subject { Cell.new }

  it 'should create a new cell subject' do
    subject.is_a?(Cell).should be_true
  end

  it 'should respond to proper methods' do
    subject.should respond_to(:alive)
    subject.should respond_to(:x)
    subject.should respond_to(:y)
  end

  it 'should initialize properly' do
    subject.alive.should be_false
    subject.x.should eq(0)
    subject.y.should eq(0)
  end

end


describe 'Game' do

  subject { Game.new }

  it 'should create a new game subject' do
    subject.is_a?(Game).should be_true
  end

end

# context 'Rules' do

#   let!(:game) { Game.new }
  
#   context 'Rule 1: Any live cell with fewer than two live neighbors dies, as if caused by under-population.' do
    
#     it 'should kill a live cell with 1 or fewer neighbors' do
      
#     end

#   end

# end




