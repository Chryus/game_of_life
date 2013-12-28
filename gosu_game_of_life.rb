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
	end

	def update
	end

	def draw
		draw_quad(0, 0, @background_color,
							width, 0, @background_color, #top right corner of screen
							width, height, @background_color, #bottom right corner of screen
							0, height, @background_color) #bottom left corner
	end

	def needs_cursor?; true; end

end

GameOfLifeWindow.new.show