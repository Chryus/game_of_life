Dir.glob('/*.rb') do |model|
  require_relative model
end

class Rules

	attr_accessor :tick

	def initialize

	end


end
