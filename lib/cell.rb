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

  def alive?
    alive
  end

  # world.cell_grid.each do |grid|
  #   grid.each do |row|
  #     row.each do |cell|
  #       cell.alive = true
  #     end
  #   end
  # end

end
