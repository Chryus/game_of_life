#2d array as grid, each array is a row [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
Dir.glob('/*.rb') do |model|
  require_relative model
end

class World

  attr_accessor :rows, :cols, :cell_grid

  def initialize(rows=3, cols=3)
    @rows = rows
    @cols = cols
    
    
    #    X=   0          1         2      
 #Y # 0 [[Cell.new][Cell.new][Cell.new]]
    # 1 [[Cell.new][Cell.new][Cell.new]]
 #Y # 2 [[Cell.new][Cell.new][Cell.new]]

    @cell_grid =  Array.new(rows) do |row| #each row creates a new array with columns and each column creates a new cell
                    Array.new(cols) do |col|
                      Cell.new(col, row)
                    end
                  end 
  end

  def live_neighbors_around_cell(cell)
    live_neighbors = []
    if cell.y > 0
      candidate = self.cell_grid[cell.y - 1][cell.x]
      live_neighbors << candidate if candidate.alive?
    end
    if cell.x < 2
      candidate = self.cell_grid[cell.y][cell.x + 1]
      live_neighbors << candidate if candidate.alive?
      live_neighbors
    end
    if cell.y > 0 && cell.x < 2
      candidate = self.cell_grid[cell.y - 1][cell.x + 1]
      live_neighbors << candidate if candidate.alive?
    end
    if cell.y < 2 && cell.x < 2
      candidate = self.cell_grid[cell.y + 1][cell.x + 1]
      live_neighbors << candidate if candidate.alive?
    end
    live_neighbors
  end




end 