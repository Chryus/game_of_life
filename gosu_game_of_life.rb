#gosu file

require 'gosu'
Dir.glob('/*.rb') do |model|
  require_relative model
end

class GameOfLifeWindow < Gosu::Window

	def initialize
		super 800, 600, false
		self.caption = "Gosu Tutorial Game"

		#color
		@background_color = Gosu::Color.new(0xffdedede)
	end

	def update
	end

	def draw
		draw_quad(0, 0, @background_color, line)
	end

	def needs_cursor?; true; end

end

GameOfLifeWindow.new.show