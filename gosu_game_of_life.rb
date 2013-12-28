#gosu file

require 'gosu'
Dir.glob('/*.rb') do |model|
  require_relative model
end

class GameOfLifeWindow < Gosu::Window

	def initialize(height=800, width=600)
		@height = height
		@width = width
		super height, width, false
		self.caption = "Gosu Tutorial Game"

		#color
		@background_color = Gosu::Color.new(0xffdedede)

		#game itself
		@cols = width/10
		@rows = height/10
		@world = World.new(@cols, @rows)
		@game = Game.new(@world)
		#@game.world.randomly_populate
	end

	def update
	end

	def draw
		draw_quad(0, 0, @background_color, #top left corner of scree
							width, 0, @background_color, #top right corner 
							width, height, @background_color, #bottom right
							0, height, @background_color) #bottom left
	end

	def needs_cursor?; true; end

end

GameOfLifeWindow.new.show