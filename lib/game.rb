Dir.glob('/*.rb') do |model|
  require_relative model
end

class Game

	attr_accessor :world, :seeds

	def initialize(world=World.new, seeds=[])
		# @world = world
		# @seeds = seeds
	end
	
end
