#cell class
require_relative './world.rb'

class Cell

	attr_accessor :alive, :x, :y

	def initialize(x=0, y=0)
		@alive = false
		@x = x
		@y = y
	end

end
