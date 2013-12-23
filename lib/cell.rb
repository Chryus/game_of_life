#cell class
Dir.glob('/*.rb') do |model|
  require_relative model
end

class Cell

  attr_accessor :alive, :x, :y

  def initialize(x=0, y=0)
    @alive = false
    @x = x
    @y = y
  end

  # def find_coordinate(coordinate)
  #   results = World.cell_grid.each do |row|
  #     row.each do |cell|
  #       cell.coordinate
  #     end
  #   end
  # end

end
