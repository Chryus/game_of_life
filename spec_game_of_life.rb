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
  end


end
