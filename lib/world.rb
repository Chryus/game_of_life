#2d array as grid, each array is a row [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
Dir.glob('/*.rb') do |model|
  require_relative model
end

class World

  attr_accessor :rows, :cols, :cell_grid

  def initialize(rows=3, cols=3)
    @rows = rows
    @cols = cols

    # [[Cell.new][Cell.new][Cell.new]]
    # [[Cell.new][Cell.new][Cell.new]]
    # [[Cell.new][Cell.new][Cell.new]]

    @cell_grid =  Array.new(rows) do |row| #each row creates a new array with columns and each column creates a new cell
                    Array.new(cols) do |col|
                      Cell.new(col, row)
                    end
                  end 
  end

  def count_live_neighbors(cell)

  end




end 