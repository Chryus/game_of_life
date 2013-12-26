Dir.glob('/*.rb') do |model|
  require_relative model
end

class Game

	attr_accessor :world, :seeds

	def initialize(world=World.new, seeds=[])
		@world = world
		@seeds = seeds

		seeds.each do |seed|
			world.cell_grid[seed[0]][seed[1]].alive = true
		end

	end

	def tick!
		#kill a cell with 1 live neighbor
		world.cells.each do |cell|
			if cell.alive? && world.live_neighbors_around_cell(cell).count < 2
				cell.die!
			end
		end
	end

end
