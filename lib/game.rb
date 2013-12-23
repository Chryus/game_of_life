Dir.glob('/*.rb') do |model|
  require_relative model
end

class Game

	attr_accessor :world, :cell

	def initialize
	end

end
