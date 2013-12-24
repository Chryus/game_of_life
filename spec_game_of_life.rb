#spec file

require 'rspec'

Dir.glob('./lib/*.rb') do |model|
  require_relative model
end

describe 'Game of life' do

  let!(:world) { World.new }

  context 'World' do
    subject { World.new }
    
    it 'should create a new world subject' do
      subject.is_a?(World).should be_true
    end

    it 'should respond to proper methods' do 
      subject.should respond_to(:rows)
      subject.should respond_to(:cols)
      subject.should respond_to(:cell_grid)
      subject.should respond_to(:live_neighbors_around_cell)
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

    it 'should detect a neighbor to the north' do
      subject.cell_grid[0][1].should be_dead
      subject.cell_grid[0][1].alive = true
      subject.cell_grid[0][1].should be_alive
      sub = subject.live_neighbors_around_cell(subject.cell_grid[1][1])
      sub.count.should == 1
    end

  end

  context 'Cell' do
    subject { Cell.new }

    it 'should create a new cell subject' do
      subject.is_a?(Cell).should be_true
    end

    it 'should respond to proper methods' do
      subject.should respond_to(:alive)
      subject.should respond_to(:x)
      subject.should respond_to(:y)
      subject.should respond_to(:alive?)
    end

    it 'should initialize properly' do
      subject.alive.should be_false
      subject.x.should eq(0)
      subject.y.should eq(0)
    end

  end

  context 'Game' do

    subject { Game.new }

    it 'should create a new game subject' do
      subject.is_a?(Game).should be_true
    end

    it 'should respond to proper methods' do
      subject.should respond_to(:world)
      subject.should respond_to(:seeds)
    end

    it 'should initialize properly' do
      subject.world.is_a?(World).should be_true
      subject.seeds.is_a?(Array).should be_true
    end

    it 'should seed properly' do
      game = Game.new(world, [[1, 2], [0,2]])
      world.cell_grid[1][2].alive?.should be_true
    end

  end

  context 'Rules' do

    let!(:game) { Game.new }
    
    context 'Rule 1: Any live cell with fewer than two live neighbors dies, as if caused by under-population.' do
      
      it 'should kill a live cell with 1 live neighbor' do
        game = Game.new(world, [[1,0], [2,0]])
        #game.tick!
        #world.cell_grid[1][0].should be_dead
        #world.cell_grid[2][0].should be_dead
      end
    end
  
  end


end




