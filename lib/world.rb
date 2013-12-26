#2d array as grid, each array is a row [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
Dir.glob('/*.rb') do |model|
  require_relative model
end

class World

  attr_accessor :rows, :cols, :cell_grid

  def initialize(rows=3, cols=3)
    @rows = rows
    @cols = cols
    
    #   col=  0          1         2      
    # 0 [[Cell.new][Cell.new][Cell.new]]
    # 1 [[Cell.new][Cell.new][Cell.new]]
#row# 2 [[Cell.new][Cell.new][Cell.new]]
#cell.x < (cols - 1)

    @cell_grid =  Array.new(rows) do |row| #each row creates a new array with columns and each column creates a new cell
                    Array.new(cols) do |col|
                      Cell.new(col, row)
                    end
                  end 
  end

  def live_neighbors_around_cell(cell)
    live_neighbors = []
    #north
    if cell.y > 0
      candidate = self.cell_grid[cell.y - 1][cell.x]
      live_neighbors << candidate if candidate.alive?
    end
    #east
    if cell.x < (cols - 1)
      candidate = self.cell_grid[cell.y][cell.x + 1]
      live_neighbors << candidate if candidate.alive?
      live_neighbors
    end
    #northeast
    if cell.y > 0 && cell.x < 2
      candidate = self.cell_grid[cell.y - 1][cell.x + 1]
      live_neighbors << candidate if candidate.alive?
    end
    #southeast
    if cell.y < (rows - 1) && cell.x < (cols - 1)
      candidate = self.cell_grid[cell.y + 1][cell.x + 1]
      live_neighbors << candidate if candidate.alive?
    end
    #south
    if cell.y < (rows - 1)
      candidate = self.cell_grid[cell.y + 1][cell.x]
      live_neighbors << candidate if candidate.alive?
    end
    #southwest
    if cell.y < (rows - 1) && cell.x > 0
      candidate = self.cell_grid[cell.y + 1][cell.x - 1]
      live_neighbors << candidate if candidate.alive?
    end
    #west
    if cell.x > 0
      candidate = self.cell_grid[cell.y][cell.x - 1]
      live_neighbors << candidate if candidate.alive?
    end
    #northwest
    if cell.x > 0 && cell.y > 0
      candidate = self.cell_grid[cell.y - 1][cell.x - 1]
      live_neighbors << candidate if candidate.alive?
    end
    live_neighbors
  end




end 