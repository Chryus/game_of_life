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
		world.cells.each do |cell|
			#rule 1
			if cell.alive? && world.live_neighbors_around_cell(cell).count < 2
				cell.die!
			end
			#rule 2
			if cell.alive? && world.live_neighbors_around_cell(cell).count.between?(2,3)
				cell.alive = true
			end
			#rule 3
			if cell.alive? && world.live_neighbors_around_cell(cell).count > 3
				cell.die!
			end
			#rule 4
			if cell.dead? && world.live_neighbors_around_cell(cell).count == 3
				cell.alive = true
			end
		end
	end

end
